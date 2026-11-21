import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:uuid/uuid.dart';

import 'package:zajel_run/busIfo/modle/destination_modle/destination_modle.dart';
import 'package:zajel_run/busIfo/modle/location_modle/location_modle.dart';
import 'package:zajel_run/busIfo/modle/placesmodle/places_modle/places_modle.dart';
import 'package:zajel_run/busIfo/modle/routes_modle/routes_modle.dart';
import 'package:zajel_run/busIfo/utils/google_mapp_places_services/googleMapPlacesServices.dart';
import 'package:zajel_run/busIfo/utils/locationServices/locationservice.dart';
import 'package:zajel_run/busIfo/utils/map_services.dart';
import 'package:zajel_run/busIfo/widget/customspartedlistview.dart';
import 'package:zajel_run/busIfo/widget/customtextfiled.dart';

class Googlemapview extends StatefulWidget {
  const Googlemapview({super.key});

  @override
  State<Googlemapview> createState() => _GooglemapviewState();
}

class _GooglemapviewState extends State<Googlemapview> {
  late Locationservice locationservice;
  late GoogleMapController googleMapController;
  late DestinationModle destinationmodle;
  late LocationModle locationmodle;

  Set<Polyline> pointofroute = {};
  Set<Marker> marker = {};

  late Googlemapplacesservices placesServices;
  late List<PlacesModle> predictionesplaces = [];
  late MapServices mapServices;
  late RoutesModle routes;

  LocationData? customerpostion;
  String? sesstionToken;

  int selected_route = 0;
  late Uuid uuid;

  TextEditingController controller = TextEditingController();

  Timer? debounce;
  Timer? busTimer;

  BitmapDescriptor? busIcon;

  int currentPointIndex = 0;
  double animationProgress = 0;

  LatLng? currentBusPosition;
  double busRotation = 0;

  bool isBusMoving = false;
  bool isMapReady = false;

  // مدة الحركة بين كل نقطتين
  static const int animationDuration = 1000;

  // عدد خطوات الحركة بين كل نقطتين
  static const int animationSteps = 50;

  @override
  void initState() {
    super.initState();

    locationservice = Locationservice();
    uuid = const Uuid();
    placesServices = Googlemapplacesservices();
    mapServices = MapServices();
    routes = RoutesModle();

    featchplaces();
    loadBusIcon();
  }

  Future<void> loadBusIcon() async {
    busIcon = await BitmapDescriptor.asset(
      const ImageConfiguration(size: Size(60, 60)),
      'assets/images/bus.png',
    );

    if (mounted) {
      setState(() {});
    }
  }

  void featchplaces() {
    controller.addListener(() async {
      if (debounce?.isActive ?? false) {
        debounce?.cancel();
      }

      sesstionToken ??= uuid.v4();

      debounce = Timer(const Duration(milliseconds: 300), () async {
        if (controller.text.isNotEmpty) {
          var result = await mapServices.getPredictionPlaces(
            param: controller.text,
            sessiontoken: sesstionToken!,
          );

          predictionesplaces.clear();
          predictionesplaces.addAll(result);

          if (mounted) {
            setState(() {});
          }
        }
      });
    });
  }

  @override
  void dispose() {
    busTimer?.cancel();
    debounce?.cancel();
    controller.dispose();

    if (isMapReady) {
      googleMapController.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            initialCameraPosition: const CameraPosition(
              target: LatLng(26.5591, 31.6957),
              zoom: 13,
            ),
            onMapCreated: (controller) {
              googleMapController = controller;
              isMapReady = true;
              mapServices.updatacurrentlocation(googleMapController);
            },
            markers: marker,
            polylines: pointofroute,
          ),

          Positioned(
            top: 16,
            left: 12,
            right: 12,
            child: Column(
              children: [
                Customtextfiled(textEditingController: controller),
                const SizedBox(height: 15),

                Customspartedlistview(
                  places: predictionesplaces,
                  onslected: (placeModle) async {
                    busTimer?.cancel();
                    isBusMoving = false;

                    var rout = await mapServices.getRoutes(
                      destinition: LatLng(
                        placeModle.geometry!.location!.lat!,
                        placeModle.geometry!.location!.lng!,
                      ),
                      markers: marker,
                      googlmapcontroller: googleMapController,
                    );

                    desplyroute();

                    sesstionToken = null;
                    controller.clear();
                    predictionesplaces.clear();
                  },
                ),
              ],
            ),
          ),

          Positioned(
            left: 10,
            bottom: 10,
            child: FloatingActionButton(
              onPressed: () {
                if (isBusMoving) {
                  stopBus();
                } else {
                  startBus();
                }
              },
              child: Icon(isBusMoving ? Icons.stop : Icons.play_arrow),
            ),
          ),
        ],
      ),
    );
  }

  // عرض المسارات
  void desplyroute() {
    pointofroute.clear();

    for (int i = 0; i < mapServices.pointes.length; i++) {
      pointofroute.add(
        Polyline(
          width: 8,
          polylineId: PolylineId('$i'),
          consumeTapEvents: true,
          points: mapServices.pointes[i],
          color: i == selected_route
              ? Colors.blue
              : const Color.fromARGB(72, 33, 149, 243),
          onTap: () {
            stopBus();
            selected_route = i;
            desplyroute();
          },
        ),
      );
    }

    setState(() {});
  }

  // بدء حركة الباص
  void startBus() {
    if (mapServices.pointes.isEmpty ||
        selected_route >= mapServices.pointes.length) {
      return;
    }

    final points = mapServices.pointes[selected_route];

    if (points.length < 2) {
      return;
    }

    if (busIcon == null) {
      return;
    }

    if (currentPointIndex >= points.length - 1) {
      currentPointIndex = 0;
      animationProgress = 0;
    }

    isBusMoving = true;

    if (currentBusPosition == null) {
      currentBusPosition = points[currentPointIndex];
    }

    moveBus();
  }

  // إيقاف الحركة
  void stopBus() {
    busTimer?.cancel();

    if (mounted) {
      setState(() {
        isBusMoving = false;
      });
    }
  }

  // تحريك الباص بين نقاط المسار
  void moveBus() {
    busTimer?.cancel();

    final points = mapServices.pointes[selected_route];

    if (currentPointIndex >= points.length - 1) {
      stopBus();
      return;
    }

    final start = points[currentPointIndex];
    final end = points[currentPointIndex + 1];

    busRotation = calculateBearing(start, end);

    const totalSteps = animationSteps;
    final stepDuration = animationDuration ~/ animationSteps;

    busTimer = Timer.periodic(Duration(milliseconds: stepDuration), (timer) {
      animationProgress += 1 / totalSteps;

      if (animationProgress >= 1) {
        animationProgress = 1;
      }

      currentBusPosition = interpolate(start, end, animationProgress);

      updateBusMarker();

      if (animationProgress >= 1) {
        timer.cancel();

        currentPointIndex++;
        animationProgress = 0;

        if (currentPointIndex < points.length - 1) {
          moveBus();
        } else {
          stopBus();
        }
      }
    });
  }

  // حساب الموقع بين نقطتين
  LatLng interpolate(LatLng start, LatLng end, double fraction) {
    return LatLng(
      start.latitude + (end.latitude - start.latitude) * fraction,
      start.longitude + (end.longitude - start.longitude) * fraction,
    );
  }

  // حساب اتجاه الباص
  double calculateBearing(LatLng start, LatLng end) {
    final lat1 = start.latitude * math.pi / 180;
    final lat2 = end.latitude * math.pi / 180;

    final deltaLng = (end.longitude - start.longitude) * math.pi / 180;

    final y = math.sin(deltaLng) * math.cos(lat2);

    final x =
        math.cos(lat1) * math.sin(lat2) -
        math.sin(lat1) * math.cos(lat2) * math.cos(deltaLng);

    final bearing = math.atan2(y, x);

    return (bearing * 180 / math.pi + 360) % 360;
  }

  // تحديث Marker الباص
  void updateBusMarker() {
    if (currentBusPosition == null || !mounted) return;

    setState(() {
      marker.removeWhere((element) => element.markerId.value == 'bus');

      marker.add(
        Marker(
          markerId: const MarkerId('bus'),
          position: currentBusPosition!,
          icon: busIcon ?? BitmapDescriptor.defaultMarker,
          rotation: busRotation,
          anchor: const Offset(0.5, 0.5),
          flat: true,
          zIndexInt: 10,
        ),
      );
    });
  }
}

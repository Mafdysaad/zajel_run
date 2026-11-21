import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:zajel_run/busIfo/modle/destination_modle/destination_modle.dart';
import 'package:zajel_run/busIfo/modle/destination_modle/lat_lng.dart';
import 'package:zajel_run/busIfo/modle/location_modle/lat_lng.dart';
import 'package:zajel_run/busIfo/modle/location_modle/location_modle.dart';
import 'package:zajel_run/busIfo/modle/place_datils_modle/place_datils_modle.dart';
import 'package:zajel_run/busIfo/modle/placesmodle/places_modle/places_modle.dart';
import 'package:zajel_run/busIfo/modle/routes_modle/routes_modle.dart';
import 'package:zajel_run/busIfo/utils/google_mapp_places_services/googleMapPlacesServices.dart';
import 'package:zajel_run/busIfo/utils/locationServices/locationservice.dart';
import 'package:zajel_run/busIfo/utils/routes_services/routes_services.dart';

class MapServices {
  Googlemapplacesservices googlemapplacesservices = Googlemapplacesservices();
  var locationservice = Locationservice();
  List<List<LatLng>> pointes = [[]];
  Timer? timer;
  int currenIndex = 0;
  late double bering;

  LatLng? currentlocation;
  void updatacurrentlocation(GoogleMapController controller) {
    locationservice.getRealTimeLocation((locationdata) {
      currentlocation = LatLng(locationdata.latitude!, locationdata.longitude!);
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentlocation!, zoom: 17),
        ),
      );
    });
  }

  Future<List<PlacesModle>> getPredictionPlaces({
    required String param,
    required String sessiontoken,
  }) async {
    var predictionplaces = await googlemapplacesservices
        .predictionesPlacesEndpoint(input: param, sessionToken: sessiontoken);
    return predictionplaces;
  }

  Future<PlaceDatilsModle> getplaceDatils(String placeID) async {
    var datils = await googlemapplacesservices.placesDatilsEndpoint(
      placeID: placeID,
    );
    return datils;
  }

  Future<List<RoutesModle>> getRoutes({
    required LatLng destinition,
    required Set<Marker> markers,
    required GoogleMapController googlmapcontroller,
  }) async {
    LocationModle locationmodle = LocationModle(
      latLng: LatLngmodl(
        latitude: currentlocation!.latitude,
        longitude: currentlocation!.longitude,
      ),
    );
    DestinationModle destinationmodle = DestinationModle(
      latLng: LatLngModle(
        latitude: destinition.latitude,
        longitude: destinition.longitude,
      ),
    );
    Marker destinationmarker = Marker(
      markerId: MarkerId('destination'),
      position: destinition,
    );
    markers.add(destinationmarker);
    var routeservices = RoutesServices(
      destinationmodle: destinationmodle,
      locationmodle: locationmodle,
      googlemapplacesservices: googlemapplacesservices,
    );
    List<RoutesModle> routs = await routeservices.featchroutes();
    pointes = routeservices.decodepolyline(routs);
    LatLngBounds bounds = getLatlngBounds(pointes);
    googlmapcontroller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 20));
    return routs;
  }

  LatLngBounds getLatlngBounds(List<List<LatLng>> points) {
    double minlong = points[0][0].longitude;
    double minlat = points[0][0].latitude;
    double maxlat = points[0][0].latitude;
    double maxlong = points[0][0].longitude;
    points.expand((row) => row).forEach((item) {
      minlong = min(minlong, item.longitude);
      minlat = min(minlat, item.latitude);
      maxlong = max(maxlong, item.longitude);
      maxlat = max(maxlat, item.latitude);
    });
    return LatLngBounds(
      southwest: LatLng(minlat, minlong),
      northeast: LatLng(maxlat, maxlong),
    );
  }

  void simult_triking(
    List<LatLng> route,
    GoogleMapController controller,
    Set<Marker> markerPostion,
    void Function() fun,
  ) {
    timer?.cancel();
    timer = Timer.periodic(Duration(milliseconds: 500), (_) async {
      if (currenIndex >= route.length - 1) {
        timer!.cancel();
      }
      var start = route[currenIndex];
      var end = route[currenIndex + 1];
      bering = getBearing(start, end);

      currentlocation = currenIndex == route.length - 1
          ? lerp(start, end, 1)
          : lerp(start, end, .01);

      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentlocation!, zoom: 17),
        ),
      );
      var locationMarker = await addmarker(currentlocation!);
      currenIndex++;
      markerPostion.add(locationMarker);
      fun();
    });
  }

  Future<Marker> addmarker(LatLng latlng) async {
    BitmapDescriptor cutomMarker = await BitmapDescriptor.asset(
      ImageConfiguration(size: Size(70, 70)),
      'assets/images/vehicle.png',
    );
    var customerLocationMarker = Marker(
      markerId: MarkerId('customerLocation'),
      icon: cutomMarker,
      position: latlng,
      anchor: Offset(.5, .5),
      rotation: bering + 90,
    );

    return customerLocationMarker;
  }

  LatLng lerp(LatLng start, LatLng end, double t) {
    return LatLng(
      start.latitude + (end.latitude - start.latitude) * t,
      start.longitude + (end.longitude - start.longitude) * t,
    );
  }

  double getBearing(LatLng start, LatLng end) {
    final lat1 = start.latitude * pi / 180;
    final lon1 = start.longitude * pi / 180;

    final lat2 = end.latitude * pi / 180;
    final lon2 = end.longitude * pi / 180;

    final dLon = lon2 - lon1;

    final y = sin(dLon) * cos(lat2);
    final x = cos(lat1) * sin(lat2) - sin(lat1) * cos(lat2) * cos(dLon);

    double bearing = atan2(y, x);

    return (bearing * 180 / pi + 360) % 360;
  }
}

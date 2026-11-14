import 'package:flutter/material.dart';
import 'package:zajel_run/businfo.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

import 'package:zajel_run/homepage.dart';
import 'package:zajel_run/myprofile.dart';
import 'package:zajel_run/myticet.dart';

import 'package:zajel_run/widgets/background.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  void onpress() {
    setState(() {
      currentIndex = 0;
    });
  }

  late final List<Widget> pages = [
    const Homepage(),
    MyTeicet(onPressed: onpress),
    const BusInfo(),
    const MyProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,

      body: Background(
        appbarflex: currentIndex == 0 ? 2 : 1,
        bodyflex: currentIndex == 0 ? 3 : 2,
        slivers: [SliverToBoxAdapter(child: pages[currentIndex])],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        elevation: 20,
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(ColorsApp.bodyColor),
        selectedItemColor: Color(ColorsApp.appBarColor),
        selectedFontSize: 14,
        selectedIconTheme: IconThemeData(size: 35),
        unselectedFontSize: 14,
        unselectedIconTheme: IconThemeData(size: 35),
        unselectedItemColor: Color(ColorsApp.grayColor),
        unselectedLabelStyle: TextStyle(color: Color(ColorsApp.grayColor)),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_work), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            label: 'My Ticket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_outlined),
            label: 'Bus Inf',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'My Profile',
          ),
        ],
      ),
    );
  }
}

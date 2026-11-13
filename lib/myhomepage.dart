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
  List<Widget> pages = [
    const Homepage(),
    const MyTeicet(),
    const BusInfo(),
    const MyProfile(),
  ];
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(ciled: pages[currenIndex]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            currenIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        currentIndex: currenIndex,
        elevation: 20,
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

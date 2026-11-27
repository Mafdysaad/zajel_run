import 'package:flutter/material.dart';
import 'package:zajel_run/busIfo/businfo.dart';

import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/homepage/homepage.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/profile/myprofile.dart';
import 'package:zajel_run/ticket/myticet.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<App> {
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
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: pages[currentIndex],
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
          BottomNavigationBarItem(
            icon: Icon(Icons.home_work),
            label: l10n.home,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket_outlined),
            label: l10n.myTicket,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bus_alert_outlined),
            label: l10n.busInfo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: l10n.myProfile,
          ),
        ],
      ),
    );
  }
}

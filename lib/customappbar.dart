import 'package:flutter/material.dart';

class Customappbar extends StatelessWidget implements PreferredSizeWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsPadding: EdgeInsets.all(10),
      backgroundColor: Colors.transparent,
      actions: [Icon(Icons.notifications, color: Colors.white, size: 40)],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "مشوارك",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Icon(
            Icons.directions_bus_filled_rounded,
            color: const Color.fromRGBO(255, 154, 21, 1),
            size: 35,
          ),
        ],
      ),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.dehaze_sharp, size: 40, color: Colors.white),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

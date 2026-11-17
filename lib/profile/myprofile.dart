import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/profile/widgets/accountItems.dart';
import 'package:zajel_run/profile/widgets/custom_Avatar%20copy.dart';
import 'package:zajel_run/ticket/widgets/header.dart';

class MyProfile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 15,
          children: [
            Header(title: "My Profile", onPressed: () {}),
            SizedBox(height: 180, child: CustomAvatar()),
            Text(
              'Mafdy Saad ',
              style: Fontstyle.openSansBold19.copyWith(
                fontSize: 23,
                color: Color(ColorsApp.blackColor),
              ),
            ),

            Text(
              'MafdySaad366@gmail.com ',
              style: Fontstyle.openSansBold19.copyWith(
                fontSize: 15,
                color: Color(ColorsApp.grayColor),
              ),
            ),
            AccountMenuItem(
              icon: Icons.account_circle,
              title: 'My Account',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.lock_open_sharp,
              title: 'Password Manager',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.help_sharp,
              title: 'Help Center',
              onTap: () {},
            ),
            AccountMenuItem(
              icon: Icons.logout_sharp,
              title: 'Logout',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

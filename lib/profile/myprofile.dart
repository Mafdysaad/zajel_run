import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/profile/widgets/accountItems.dart';
import 'package:zajel_run/profile/widgets/custom_Avatar%20copy.dart';
import 'package:zajel_run/profile/widgets/logout_dalige.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/widgets/background.dart';

class MyProfile extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Background(
      height: 900,
      appbarflex: 1,
      bodyflex: 3,
      overlayChild: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Header(title: l10n.myProfile, onPressed: () {}),
              Column(
                spacing: 20,
                children: [
                  SizedBox(height: 180, child: CustomAvatar()),
                  Text(
                    'Mafdy Saad ',
                    style: Fontstyle.openSansBold23(context)
                        .copyWith(color: Color(ColorsApp.blackColor)),
                  ),

                  Text(
                    'MafdySaad366@gmail.com ',
                    style: Fontstyle.openSansBold15(context)
                        .copyWith(color: Color(ColorsApp.grayColor)),
                  ),
                  AccountMenuItem(
                    icon: Icons.account_circle,
                    title: l10n.myAccount,
                    onTap: () {},
                  ),
                  AccountMenuItem(
                    icon: Icons.lock_open_sharp,
                    title: l10n.passwordManager,
                    onTap: () {},
                  ),
                  AccountMenuItem(
                    icon: Icons.settings,
                    title: l10n.settings,
                    onTap: () {},
                  ),
                  AccountMenuItem(
                    icon: Icons.help_sharp,
                    title: l10n.helpCenter,
                    onTap: () {},
                  ),
                  AccountMenuItem(
                    icon: Icons.logout_sharp,
                    title: l10n.login,
                    onTap: () {
                      LogoutDialog.show(
                        context,
                        onConfirm: () {
                          // Logout logic
                          // Clear token
                          // Navigate to Login
                          context.go(Approutes.kLogin);
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

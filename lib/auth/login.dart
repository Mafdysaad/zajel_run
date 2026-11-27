import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/auth/widgets/custom_option.dart';
import 'package:zajel_run/auth/widgets/custom_or.dart';
import 'package:zajel_run/auth/widgets/custom_remmimber.dart';
import 'package:zajel_run/auth/widgets/custom_singup.dart';

import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Background(
        height: 900,
        appbarflex: 1,
        bodyflex: 3,
        appbarchild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              l10n.welcomeBack,
              textAlign: TextAlign.left,
              style: Fontstyle.openSansBold38(context),
            ),
          ],
        ),
        bodychild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            CustomTextField(
              icon: Icons.mail_outline,
              title: l10n.emailAddress,
              keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            CustomTextField(
              icon: Icons.lock,
              title: l10n.password,
              keyboardtype: TextInputType.visiblePassword,
            ),
            SizedBox(height: 10),
            CustomRememberMe(
              rememberMe: true,
              onRememberChanged: (v) {},
              onForgotPasswordTap: () {
                context.push(Approutes.kForgetpassword);
              },
            ),
            SizedBox(height: 30),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              width: double.infinity,
              textColor: Colors.white,
              title: l10n.login,
              onpressed: () {
                context.push(Approutes.kHomeRoute);
              },
            ),
            CustomOR(),
            SizedBox(height: 20),
            Customoption(),
            SizedBox(height: 30),
            Cusomsingup(
              textone: l10n.dontHaveAnAccount,
              textwo: l10n.createAccount,
              onTap: () {
                context.push(Approutes.kSinup);
              },
            ),
          ],
        ),
      ),
    );
  }
}

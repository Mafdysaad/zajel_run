import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/auth/widgets/custom_option.dart';
import 'package:zajel_run/auth/widgets/custom_or.dart';
import 'package:zajel_run/auth/widgets/custom_remmimber.dart';
import 'package:zajel_run/auth/widgets/custom_singup.dart';
import 'package:zajel_run/auth/widgets/police.dart';

import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/circuleshap.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class Sinup extends StatelessWidget {
  const Sinup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        appbarflex: 1,
        bodyflex: 3,
        appbarchild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Circlsahap(
                  child: IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 85),
            Text(
              "Get Started Today",
              textAlign: TextAlign.left,
              style: Fontstyle.openSansBold19.copyWith(fontSize: 40),
            ),
          ],
        ),
        bodychild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            CustomTextField(icon: Icons.person_sharp, title: 'Full Name'),
            SizedBox(height: 20),
            CustomTextField(icon: Icons.mail_outline, title: 'Email Address'),
            SizedBox(height: 20),
            CustomTextField(icon: Icons.lock, title: 'Password'),
            SizedBox(height: 10),
            CustomAgreementCheckbox(
              onChanged: (value) {},
              value: false,
              onPrivacyTap: () {},
              onAgreementTap: () {},
            ),
            SizedBox(height: 30),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              width: double.infinity,
              textColor: Colors.white,
              title: 'Login',
              onpressed: () {},
            ),
            CustomOR(),

            SizedBox(height: 20),
            Customoption(),
            SizedBox(height: 30),
            Cusomsingup(
              textone: 'Already Have An Account?',
              textwo: 'Login',
              onTap: () {
                context.push(Approutes.kLogin);
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/auth/widgets/custom_singup.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/circuleshap.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<Forgetpassword> {
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
            Spacer(),
            Text(
              "Forgot Password",
              textAlign: TextAlign.left,
              style: Fontstyle.openSansBold38(context),
            ),
          ],
        ),
        bodychild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            CustomTextField(
              title: 'Email Address',
              icon: Icons.email_outlined,
              keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(height: 30),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              width: double.infinity,
              textColor: Colors.white,
              title: 'Send Code',
              onpressed: () {
                context.push(Approutes.kverifyAccount);
              },
            ),
            SizedBox(height: 40),
            Cusomsingup(
              textone: 'Go back to',
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

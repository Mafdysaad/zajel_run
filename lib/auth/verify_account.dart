import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:zajel_run/auth/widgets/custom_option.dart';
import 'package:zajel_run/auth/widgets/custom_or.dart';

import 'package:zajel_run/auth/widgets/custom_singup.dart';
import 'package:zajel_run/auth/widgets/police.dart';
import 'package:zajel_run/auth/widgets/resendcodeTimer.dart';

import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/circuleshap.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class VerifyAccount extends StatefulWidget {
  const VerifyAccount({super.key});

  @override
  State<VerifyAccount> createState() => _VerifyAccountState();
}

class _VerifyAccountState extends State<VerifyAccount> {
  final TextEditingController otpController = TextEditingController();

  final FocusNode otpFocusNode = FocusNode();

  @override
  void dispose() {
    otpController.dispose();
    otpFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 60,
      height: 62,
      margin: EdgeInsets.all(8),
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(ColorsApp.grayColor)),
      ),
    );

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
              "Verify Your Account",
              textAlign: TextAlign.left,
              style: Fontstyle.openSansBold19.copyWith(fontSize: 38),
            ),
          ],
        ),
        bodychild: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40),
            Pinput(
              length: 4,
              controller: otpController,
              focusNode: otpFocusNode,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: const Color(0xFF246775), width: 2),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: defaultPinTheme.decoration!.copyWith(
                  border: Border.all(color: const Color(0xFF246775), width: 2),
                ),
              ),
              keyboardType: TextInputType.number,
              showCursor: true,
              autofocus: true,
            ),
            SizedBox(height: 30),
            ResendCodeTimer(onResend: () {}),
            SizedBox(height: 80),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              width: double.infinity,
              textColor: Colors.white,
              title: 'Verify',
              onpressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

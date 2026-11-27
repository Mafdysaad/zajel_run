import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/auth/widgets/custom_singup.dart';
import 'package:zajel_run/auth/widgets/police.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/circuleshap.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class Sinup extends StatelessWidget {
  const Sinup({super.key});

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
              l10n.getStartedToday,
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
              icon: Icons.person_sharp,
              title: l10n.fullName,
              keyboardtype: TextInputType.text,
            ),
            SizedBox(height: 20),
            CustomTextField(
              icon: Icons.mail_outline,
              title: l10n.emailAddress,
              keyboardtype: TextInputType.emailAddress,
            ),
            SizedBox(height: 20),
            CustomTextField(
              icon: Icons.lock,
              title: l10n.password,
              keyboardtype: TextInputType.emailAddress,
            ),
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
              title: l10n.createAccount,
              onpressed: () {
                context.push(Approutes.kverifyAccount);
              },
            ),
            Cusomsingup(
              textone: l10n.alreadyHaveAnAccount,
              textwo: l10n.login,
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

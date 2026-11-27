import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart' show ColorsApp;
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/homepage/widgets/advertisements.dart';
import 'package:zajel_run/homepage/widgets/customappbar.dart';
import 'package:zajel_run/homepage/widgets/reservationCard.dart';
import 'package:zajel_run/widgets/background.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Background(
      height: 890,
      appbarflex: 2,
      bodyflex: 3,
      overlayChild: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Customappbar(),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.letsBookYourNextTrip,
                    style: Fontstyle.openSansBold30(context),
                  ),
                  const SizedBox(height: 20),
                  Reservationcard(),
                  Row(
                    children: [
                      Text(
                        l10n.hotNews,
                        style: Fontstyle.openSansBold23(context)
                            .copyWith(color: Color(ColorsApp.blackColor)),
                      ),
                      Spacer(),
                      Text(
                        l10n.seeAll,
                        style: Fontstyle.openSansBold18(context)
                            .copyWith(color: Color(ColorsApp.appBarColor)),
                      ),
                    ],
                  ),
                  Advertisements(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

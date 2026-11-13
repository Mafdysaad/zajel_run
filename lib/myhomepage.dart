import 'package:flutter/material.dart';

import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/customappbar.dart';

import 'package:zajel_run/widgets/BookingDateField.dart';
import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/advertisements.dart';
import 'package:zajel_run/widgets/background.dart';

import 'package:zajel_run/widgets/custom_buttom.dart';
import 'package:zajel_run/widgets/drop_down.dart';
import 'package:zajel_run/widgets/reservationCard.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        ciled: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 75),

              Customappbar(),

              const SizedBox(height: 25),

              Text(
                "Let's book Your \nNext Trip!",
                style: Fontstyle.openSansBold19.copyWith(fontSize: 30),
              ),

              const SizedBox(height: 20),
              Reservationcard(),
              Row(
                children: [
                  Text(
                    'Hot News',
                    style: Fontstyle.openSansBold19.copyWith(
                      color: Color(ColorsApp.blackColor),
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'See All',
                    style: Fontstyle.openSansBold19.copyWith(
                      color: Color(ColorsApp.appBarColor),
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Advertisements(),
            ],
          ),
        ),
      ),
    );
  }
}

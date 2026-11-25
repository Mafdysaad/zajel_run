import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart' show ColorsApp;
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/homepage/widgets/customappbar.dart';
import 'package:zajel_run/homepage/widgets/advertisements.dart';
import 'package:zajel_run/homepage/widgets/reservationCard.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Customappbar(),
          const SizedBox(height: 25),
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Let's book Your \nNext Trip!",
                        style: Fontstyle.openSansBold30(context),
                      ),
                      const SizedBox(height: 20),
                      Reservationcard(),
                      Row(
                        children: [
                          Text(
                            'Hot News',
                            style: Fontstyle.openSansBold23(context)
                                .copyWith(color: Color(ColorsApp.blackColor)),
                          ),
                          Spacer(),
                          Text(
                            'See All',
                            style: Fontstyle.openSansBold18(context)
                                .copyWith(color: Color(ColorsApp.appBarColor)),
                          ),
                        ],
                      ),
                      Advertisements(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

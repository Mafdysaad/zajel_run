import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/const/size_config.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/reservation/passaneger_detiails.dart';
import 'package:zajel_run/reservation/widgets/bus_seat_selector.dart';
import 'package:zajel_run/reservation/widgets/legend_item.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';

import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class SlecetYourSeat extends StatelessWidget {
  const SlecetYourSeat({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    print('===========> heigth =${MediaQuery.of(context).size.height}');
    print('===========>width = ${MediaQuery.of(context).size.width}');
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        height: MediaQuery.of(context).size.width >= 1280
            ? 1750
            : MediaQuery.of(context).size.width >= 1180
            ? 1450
            : MediaQuery.of(context).size.width >= SizeConfig.tablet
            ? 1400
            : 1150,
        appbarflex: 1,
        bodyflex: 5,
        overlayChild: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Column(
              children: [
                Header(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: l10n.selectYourSeat,
                ),
                TicketCard(
                  ticket: TicketModel(
                    companyName: 'Jahanabad Express',
                    seatClass: 'S Chair',
                    seatNumber: 'A1',
                    fromCode: 'DHK',
                    fromCity: 'Dhaka',
                    toCode: 'KHL',
                    toCity: 'Khulna',
                    departureTime: '08:00 PM',
                    arrivalTime: '11:45 PM',
                    departureDate: '11 Aug, 2025',
                    arrivalDate: '11 Aug, 2025',
                    duration: '3h 45m',
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: LegendItem(
                        title: l10n.available,
                        color: ColorsApp.availableColor,
                      ),
                    ),
                    Expanded(
                      child: LegendItem(
                        title: l10n.selected,
                        color: ColorsApp.selectedColor,
                      ),
                    ),
                    Expanded(
                      child: LegendItem(
                        title: l10n.booked,
                        color: const Color(0xFF6B7280),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.width >= 1280
                      ? 1000
                      : MediaQuery.of(context).size.width >= SizeConfig.tablet
                      ? 700
                      : 400,
                  child: SingleChildScrollView(child: BusSeatSelector()),
                ),

                SizedBox(height: 30),
                CustomButtom(
                  backgroundColor: Color(ColorsApp.appBarColor),
                  textColor: Colors.white,
                  title: l10n.selectYourSeat,
                  width: double.infinity,
                  onpressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PassanegerDetiails(),
                      ),
                    );
                  },
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

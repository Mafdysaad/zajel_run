import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/reservation/widgets/contact_infor.dart';
import 'package:zajel_run/reservation/widgets/payment_detials.dart';
import 'package:zajel_run/reservation/widgets/payment_method.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';

import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';
import 'package:zajel_run/widgets/section_title.dart';

class PassanegerDetiails extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        height: 1150,
        appbarflex: 1,
        bodyflex: 3,
        overlayChild: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Header(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: "Slecet Your Seat",
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
                SectionTitle(title: l10n.contactInfo),
                ContactInfor(),
                SizedBox(height: 20),
                SectionTitle(title: l10n.paymentDetails),
                PaymentDetials(),
                SizedBox(height: 10),
                SectionTitle(title: l10n.paymentMethod),
                PaymentMethodDropdown(),
                SizedBox(height: 50),
                CustomButtom(
                  backgroundColor: Color(ColorsApp.appBarColor),
                  width: double.infinity,
                  textColor: Colors.white,
                  title: l10n.pay,
                  onpressed: () {
                    context.push(Approutes.kTicetdatiels);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

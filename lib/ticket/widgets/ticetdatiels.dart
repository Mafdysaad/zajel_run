import 'package:flutter/material.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';

import 'package:zajel_run/widgets/background.dart';

import 'package:zajel_run/widgets/rowsection.dart';
import 'package:zajel_run/widgets/test_qr_page.dart';
import 'package:zajel_run/widgets/tiketInform.dart';

class Ticetdatiels extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: Background(
        height: 1200,
        appbarflex: 1,
        bodyflex: 3,
        overlayChild: SafeArea(
          child: Padding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
            child: Column(
              children: [
                Header(
                  title: l10n.myTicket,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Column(
                  spacing: 20,
                  children: [
                    TicketCard(
                      ticket: TicketModel(
                        companyName: 'Jahanabad Express',
                        seatClass: 'أسيوط',
                        seatNumber: 'A1',
                        fromCode: 'طما',
                        fromCity: 'سوهاج',
                        toCode: 'KHL',
                        toCity: 'Khulna',
                        departureTime: '08:00 PM',
                        arrivalTime: '11:45 PM',
                        departureDate: '11 Aug, 2025',
                        arrivalDate: '11 Aug, 2025',
                        duration: '3h 45m',
                      ),
                    ),
                    Ticketinform(
                      child: Column(
                        spacing: 15,
                        children: [
                          Rowsection(
                            title: 'Passenger 01',
                            leading: 'Mafdy Saad (adibt)',
                          ),
                          Rowsection(
                            title: 'Passenger 02',
                            leading: 'Mafdy Saad (adibt)',
                          ),
                        ],
                      ),
                    ),
                    Ticketinform(
                      child: Column(
                        spacing: 15,
                        children: [
                          Rowsection(
                            title: l10n.emailAddress,
                            leading: 'MafdySaad366@gmail.com',
                          ),
                          Rowsection(
                            title: 'رقم التلفون',
                            leading: '+201022102989',
                          ),
                        ],
                      ),
                    ),
                    TestQrPage(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

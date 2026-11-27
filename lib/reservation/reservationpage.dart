import 'package:flutter/material.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/reservation/slecet_your_seat.dart';
import 'package:zajel_run/reservation/widgets/horizontalCalendar.dart';
import 'package:zajel_run/reservation/widgets/slectedTicketcard.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/widgets/background.dart';

class Reservationpage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        height: 900,
        appbarflex: 1,
        bodyflex: 4,
        overlayChild: SafeArea(
          child: Column(
            spacing: 20,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Header(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  title: l10n.searchResult,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Slectedticketcard(
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
              ),
              HorizontalCalendar(onDateSelected: (date) {}),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          spacing: 15,
                          children: List.generate(3, (index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const SlecetYourSeat(),
                                  ),
                                );
                              },
                              child: TicketCard(
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
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

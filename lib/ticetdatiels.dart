import 'package:flutter/material.dart';
import 'package:zajel_run/modles/ticketmodel.dart';
import 'package:zajel_run/widgets/TicketCard.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/header.dart';

class Ticetdatiels extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        appbarflex: 1,
        bodyflex: 2,
        slivers: [
          SliverToBoxAdapter(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Header(
                      title: 'My ticket',
                      onPressed: () {
                        Navigator.pop(context);
                      },
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

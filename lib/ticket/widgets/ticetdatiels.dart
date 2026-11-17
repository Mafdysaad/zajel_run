import 'package:flutter/material.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/widgets/rowsection.dart';
import 'package:zajel_run/widgets/test_qr_page.dart';
import 'package:zajel_run/widgets/tiketInform.dart';

class Ticetdatiels extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        appbarflex: 1,
        bodyflex: 2,
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
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        spacing: 20,
                        children: [
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
                                  title: 'Email',
                                  leading: 'MafdySaad366@gmail.com',
                                ),
                                Rowsection(
                                  title: 'phone Number',
                                  leading: '+201022102989',
                                ),
                                Rowsection(
                                  title: 'identity Number',
                                  leading: '28384720020',
                                ),
                              ],
                            ),
                          ),
                          TestQrPage(),
                        ],
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

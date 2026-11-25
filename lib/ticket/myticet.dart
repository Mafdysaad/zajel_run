import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/ticetdatiels.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';

import 'package:zajel_run/ticket/widgets/customtickettabs.dart';
import 'package:zajel_run/ticket/widgets/header.dart';

class MyTeicet extends StatefulWidget {
  final VoidCallback onPressed;
  const MyTeicet({required this.onPressed, super.key});

  @override
  State<MyTeicet> createState() => _MyTeicetState();
}

class _MyTeicetState extends State<MyTeicet> {
  int selectedIndex = 0;

  final List<TicketModel> ongoingTickets = [
    TicketModel(
      companyName: 'Jahanabad Express',
      seatClass: 'S Chair',
      seatNumber: 'D1,D2',
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
    TicketModel(
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
  ];

  final List<TicketModel> completedTickets = [
    TicketModel(
      companyName: 'Jahanabad Express',
      seatClass: 'S Chair',
      seatNumber: 'D1,D2',
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
  ];

  final List<TicketModel> cancelledTickets = [];

  List<TicketModel> get currentTickets {
    switch (selectedIndex) {
      case 0:
        return ongoingTickets;
      case 1:
        return completedTickets;
      case 2:
        return cancelledTickets;
      default:
        return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          Header(title: 'My ticket', onPressed: widget.onPressed),

          const SizedBox(height: 30),

          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Tabs
                      CustomTicketTabs(
                        onTabChanged: (val) {
                          setState(() {
                            selectedIndex = val;
                          });
                        },
                      ),

                      const SizedBox(height: 20),

                      // Tickets
                      if (currentTickets.isEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              'No Tickets Found',
                              style: Fontstyle.openSansRegular16(context)
                                  .copyWith(color: Colors.grey),
                            ),
                          ),
                        )
                      else
                        ...currentTickets.map(
                          (ticket) => Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Ticetdatiels(),
                                  ),
                                );
                              },
                              child: TicketCard(ticket: ticket),
                            ),
                          ),
                        ),
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

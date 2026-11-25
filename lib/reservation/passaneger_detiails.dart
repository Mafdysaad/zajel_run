import 'package:flutter/material.dart';
import 'package:zajel_run/reservation/widgets/contact_infor.dart';
import 'package:zajel_run/reservation/widgets/payment_detials.dart';
import 'package:zajel_run/reservation/widgets/payment_method.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/section_title.dart';

class PassanegerDetiails extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Background(
        appbarflex: 1,
        bodyflex: 2,
        child: SafeArea(
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
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
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
                            SizedBox(height: 20),
                            SectionTitle(title: 'Contact Info'),
                            ContactInfor(),
                            SizedBox(height: 20),
                            SectionTitle(title: 'payment Detials'),
                            PaymentDetials(),
                            SizedBox(height: 10),
                            SectionTitle(title: 'payment Method'),
                            PaymentMethodDropdown(),
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
      ),
    );
  }
}

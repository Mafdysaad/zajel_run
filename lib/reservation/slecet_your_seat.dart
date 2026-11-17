import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/reservation/widgets/bus_seat_selector.dart';
import 'package:zajel_run/reservation/widgets/legend_item.dart';
import 'package:zajel_run/reservation/widgets/seat_catigo.dart';
import 'package:zajel_run/ticket/modles/ticketmodel.dart';
import 'package:zajel_run/ticket/widgets/TicketCard.dart';
import 'package:zajel_run/ticket/widgets/header.dart';
import 'package:zajel_run/widgets/background.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';

class SlecetYourSeat extends StatelessWidget {
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
            padding: const EdgeInsets.symmetric(horizontal: 25),
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
                            Row(
                              spacing: 15,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: LegendItem(
                                    title: "Available",
                                    color: ColorsApp.availableColor,
                                  ),
                                ),
                                Expanded(
                                  child: LegendItem(
                                    title: "selected",
                                    color: ColorsApp.selectedColor,
                                  ),
                                ),
                                Expanded(
                                  child: LegendItem(
                                    title: "booked",
                                    color: ColorsApp.bookedColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            SeatCatigo(),
                            BusSeatSelector(),
                            SizedBox(height: 15),
                            CustomButtom(
                              backgroundColor: Color(ColorsApp.appBarColor),
                              textColor: Colors.white,
                              title: "Select Your Seat",
                              width: double.infinity,
                              onpressed: () {},
                            ),
                            SizedBox(height: 10),
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

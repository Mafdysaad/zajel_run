import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/reservation/reservationpage.dart';
import 'package:zajel_run/widgets/BookingDateField.dart';

import 'package:zajel_run/widgets/custom_buttom.dart';
import 'package:zajel_run/widgets/drop_down.dart';

class Reservationcard extends StatefulWidget {
  const Reservationcard({super.key});

  @override
  State<Reservationcard> createState() => _ReservationcardState();
}

class _ReservationcardState extends State<Reservationcard> {
  bool is_round = true;
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      height: 420,
      decoration: BoxDecoration(
        color: Color(ColorsApp.bodyColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                spacing: 10,
                children: [
                  CustomButtom(
                    backgroundColor: is_round
                        ? Color(ColorsApp.appBarColor)
                        : Color(ColorsApp.backgroundIcon),
                    textColor: is_round
                        ? Colors.white
                        : Color(ColorsApp.blackColor),
                    title: l10n.roundTrip,
                    onpressed: () {
                      setState(() {
                        is_round = true;
                      });
                    },
                  ),
                  CustomButtom(
                    backgroundColor: is_round
                        ? Color(ColorsApp.backgroundIcon)
                        : Color(ColorsApp.appBarColor),
                    textColor: is_round ? Colors.black : Colors.white,
                    title: l10n.oneWay,
                    onpressed: () {
                      setState(() {
                        is_round = false;
                      });
                    },
                  ),
                ],
              ),
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  spacing: 15,
                  children: [
                    DropDownWidget(
                      items: [
                        l10n.tima,
                        l10n.assiut,
                        l10n.alMohafza,
                        l10n.alKawamil,
                      ],
                      onChanged: (_) {},
                      selectedItem: l10n.tima,
                      leadingIcon: Icons.place,
                    ),
                    DropDownWidget(
                      items: [
                        l10n.alKawamil,
                        l10n.assiut,
                        l10n.alMohafza,
                        l10n.tima,
                      ],
                      onChanged: (_) {},
                      selectedItem: l10n.alKawamil,
                      leadingIcon: Icons.place,
                    ),
                  ],
                ),

                Positioned.directional(
                  textDirection: TextDirection.rtl,
                  top: 40,
                  end: 30,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: is_round
                          ? Color(ColorsApp.appBarColor)
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(
                      Icons.swap_vert,
                      color: is_round ? Colors.white : Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            BookingDateField(),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              textColor: Colors.white,
              title: l10n.searchTicket,
              width: double.infinity,
              onpressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Reservationpage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/widgets/BookingDateField.dart';
import 'package:zajel_run/widgets/CustomTextField.dart';
import 'package:zajel_run/widgets/custom_buttom.dart';
import 'package:zajel_run/widgets/drop_down.dart';
import 'package:zajel_run/reservation/reservationpage.dart';

class Reservationcard extends StatelessWidget {
  const Reservationcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      decoration: BoxDecoration(
        color: Color(ColorsApp.bodyColor),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Column(
          spacing: 15,
          children: [
            SizedBox(
              height: 40,
              child: Row(
                spacing: 10,
                children: [
                  CustomButtom(
                    backgroundColor: Color(ColorsApp.appBarColor),
                    textColor: Colors.white,
                    title: 'One way',
                    onpressed: () {},
                  ),
                  CustomButtom(
                    backgroundColor: Color(ColorsApp.backgroundIcon),
                    textColor: Color(ColorsApp.blackColor),
                    title: 'Round Trip',
                    onpressed: () {},
                  ),
                ],
              ),
            ),

            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    CustomTextField(title: 'From', icon: Icons.send_rounded),
                    SizedBox(height: 20),

                    CustomTextField(
                      title: 'To',
                      icon: Icons.location_on_outlined,
                    ),
                  ],
                ),

                Positioned(
                  top: 40,
                  right: 30,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Icon(Icons.swap_vert),
                  ),
                ),
              ],
            ),
            BookingDateField(),
            DropDownWidget(
              items: ['S Class', 'F Class', 'B Class'],
              onChanged: (_) {},
              selectedItem: 'S Class',
              leadingIcon: Icons.chair_outlined,
            ),
            CustomButtom(
              backgroundColor: Color(ColorsApp.appBarColor),
              textColor: Colors.white,
              title: 'Search Ticket',
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

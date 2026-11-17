import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart' show Fontstyle;
import 'package:zajel_run/widgets/circuleshap.dart';
import 'package:zajel_run/profile/widgets/custom_Avatar%20copy.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        children: [
          CustomAvatar(),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Good Moorning ',
                style: Fontstyle.openSansBold19.copyWith(fontSize: 18),
              ),
              Text(
                "Mafdy Saad",
                style: Fontstyle.openSansBold19.copyWith(fontSize: 14),
              ),
            ],
          ),
          Spacer(),
          Circlsahap(
            child: Icon(
              Icons.notifications_on_outlined,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}

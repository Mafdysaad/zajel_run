import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';

class LegendItem extends StatelessWidget {
  final String title;
  final Color? color;
  const LegendItem({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 5,
      children: [
        SizedBox(
          height: 30,
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(6),
              ),
            ),
          ),
        ),

        FittedBox(
          child: Text(
            title,
            style: Fontstyle.openSansBold14(context).copyWith(
              color: Colors.black,
              fontSize: responsivesize(context, fontsize: 13),
            ),
          ),
        ),
      ],
    );
  }
}

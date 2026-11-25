import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class LegendItem extends StatelessWidget {
  final String title;
  final Color? color;
  const LegendItem({super.key, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 15,
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

        Text(
          title,
          style: Fontstyle.openSansBold14(context)
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

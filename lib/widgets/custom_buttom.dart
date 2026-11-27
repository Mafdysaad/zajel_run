import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';

class CustomButtom extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String title;
  final Function()? onpressed;
  final double? width;

  const CustomButtom({
    required this.backgroundColor,
    required this.textColor,
    required this.title,
    this.width,
    this.onpressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: width,
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 1,

          shape: RoundedRectangleBorder(
            side: BorderSide(width: .5),
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        child: Text(
          title,
          style: Fontstyle.openSansBold19(context).copyWith(
            fontSize: responsivesize(context, fontsize: 20),
            color: textColor,
          ),
        ),
      ),
    );
  }
}

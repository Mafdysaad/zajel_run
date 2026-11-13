import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: ShapeDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/images/av.jpg"),
            fit: BoxFit.fill,
          ),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0xFFFBFBFF)),
            borderRadius: BorderRadius.circular(120),
          ),
        ),
      ),
    );
  }
}

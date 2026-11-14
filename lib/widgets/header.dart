import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/widgets/circuleshap.dart';

class Header extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const Header({required this.onPressed, required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      children: [
        Circlsahap(
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: Fontstyle.openSansBold19.copyWith(fontSize: 25),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: 45),
      ],
    );
  }
}

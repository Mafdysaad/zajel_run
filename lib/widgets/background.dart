import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final Widget ciled;
  const Background({required this.ciled, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Color(ColorsApp.appBarColor)),
              ),
              Expanded(
                flex: 3,
                child: Container(color: Color(ColorsApp.bodyColor)),
              ),
            ],
          ),
        ),
        Positioned.fill(child: ciled),
      ],
    );
  }
}

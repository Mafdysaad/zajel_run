import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final Widget child;
  final int bodyflex, appbarflex;

  const Background({
    required this.appbarflex,
    required this.bodyflex,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Column(
            children: [
              Expanded(
                flex: appbarflex,
                child: Container(color: Color(ColorsApp.appBarColor)),
              ),
              Expanded(
                flex: bodyflex,
                child: Container(color: Color(ColorsApp.bodyColor)),
              ),
            ],
          ),
        ),
        SafeArea(child: child),
      ],
    );
  }
}

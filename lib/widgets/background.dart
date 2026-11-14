import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final List<Widget> slivers;
  final int bodyflex, appbarflex;

  const Background({
    required this.appbarflex,
    required this.bodyflex,
    required this.slivers,
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
        Positioned.fill(
          child: SafeArea(child: CustomScrollView(slivers: slivers)),
        ),
      ],
    );
  }
}

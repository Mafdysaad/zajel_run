import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final Widget? child;
  final Widget? appbarchild;
  final Widget? bodychild;

  final int bodyflex;
  final int appbarflex;

  const Background({
    super.key,
    required this.appbarflex,
    required this.bodyflex,
    this.child,
    this.appbarchild,
    this.bodychild,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxHeight,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: appbarflex,
                    child: Container(
                      width: double.infinity,
                      color: Color(ColorsApp.appBarColor),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SafeArea(
                        child: appbarchild ?? const SizedBox.shrink(),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: bodyflex,
                    child: Container(
                      width: double.infinity,
                      color: Color(ColorsApp.bodyColor),
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.manual,
                        child: bodychild ?? const SizedBox.shrink(),
                      ),
                    ),
                  ),
                ],
              ),

              if (child != null) SafeArea(child: child!),
            ],
          ),
        );
      },
    );
  }
}

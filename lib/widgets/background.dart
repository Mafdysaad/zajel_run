import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final Widget? child;
  final Widget? appbarchild;
  final Widget? bodychild;

  final int bodyflex, appbarflex;

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
    final bool useFullContent = child != null;

    final Widget backgroundStack = SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  flex: appbarflex,
                  child: Container(
                    width: double.infinity,
                    color: Color(ColorsApp.appBarColor),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: appbarchild ?? const SizedBox.shrink(),
                  ),
                ),
                Expanded(
                  flex: bodyflex,
                  child: Container(
                    width: double.infinity,
                    color: Color(ColorsApp.bodyColor),
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: bodychild ?? const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
          if (child != null) SafeArea(child: child!),
        ],
      ),
    );

    return useFullContent
        ? backgroundStack
        : SingleChildScrollView(child: backgroundStack);
  }
}

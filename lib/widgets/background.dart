import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class Background extends StatelessWidget {
  final Widget? appbarchild;
  final Widget? bodychild;
  final Widget? overlayChild;
  final double height;
  final int appbarflex;
  final int bodyflex;

  const Background({
    super.key,
    this.appbarchild,
    this.bodychild,
    this.overlayChild,
    required this.appbarflex,
    required this.height,
    required this.bodyflex,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double designHeight = constraints.maxHeight < height
            ? height
            : constraints.maxHeight;
        return CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            // Background + AppBar + Body + overlapping elements
            SliverToBoxAdapter(
              child: SizedBox(
                height: designHeight,
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
                            child: bodychild ?? const SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),

                    if (overlayChild != null)
                      Positioned.fill(child: overlayChild!),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

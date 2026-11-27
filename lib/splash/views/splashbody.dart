import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/splash/views/slidingtext.dart';

class Splashbody extends StatefulWidget {
  const Splashbody({super.key});

  @override
  State<Splashbody> createState() => _SplashbodyState();
}

class _SplashbodyState extends State<Splashbody>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> textanimation;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    initslidingAnimation();
    timer = Timer(const Duration(seconds: 5), () {
      if (!mounted) return;
      context.go(Approutes.kLogin);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset('assets/images/logo.png', fit: BoxFit.fitHeight),
          ),
          SlidingText(textanimation: textanimation),
        ],
      ),
    );
  }

  void initslidingAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();
    textanimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(controller);
  }
}

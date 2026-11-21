import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/helperfunction.dart';
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
  @override
  void initState() {
    initslidingAnimation();
    super.initState();
    transition(context);
  }

  @override
  void dispose() {
    controller.dispose();
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
      duration: const Duration(seconds: 2),
    )..forward();
    textanimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(controller);
  }
}

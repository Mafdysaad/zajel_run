import 'package:flutter/material.dart';
import 'package:zajel_run/splash/views/splashbody.dart';

class Splash extends StatefulWidget {
  const new({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              height: 300,
              width: 300,
              child: Image.asset(
                'assets/images/backimage.png',
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned.fill(child: Splashbody()),
        ],
      ),
    );
  }
}

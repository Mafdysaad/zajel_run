import 'package:flutter/material.dart';
import 'package:zajel_run/customappbar.dart';

class MyHomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Customappbar(),
      body: Stack(
        children: [
          Positioned(child: Image.asset('assets/images/background.jpeg')),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(children: []),
            ),
          ),
        ],
      ),
    );
  }
}

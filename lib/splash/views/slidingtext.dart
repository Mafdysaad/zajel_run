import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.textanimation});

  final Animation<Offset> textanimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: textanimation,
      builder: (context, child) {
        return SlideTransition(
          position: textanimation,
          child: const Text(
            'Book your bus ticket',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}

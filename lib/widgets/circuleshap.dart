import 'package:flutter/material.dart';

class Circlsahap extends StatelessWidget {
  const Circlsahap({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 13, 107, 154),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
      child: Padding(padding: const EdgeInsets.all(10.0), child: child),
    );
  }
}

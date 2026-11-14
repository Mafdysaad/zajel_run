import 'package:flutter/material.dart';

class Circlsahap extends StatelessWidget {
  const Circlsahap({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color.fromARGB(255, 3, 105, 157),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(120)),
      ),
      child: Padding(padding: const EdgeInsets.all(10), child: child),
    );
  }
}

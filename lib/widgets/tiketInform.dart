import 'package:flutter/material.dart';

class Ticketinform extends StatelessWidget {
  final Widget child;
  const Ticketinform({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Padding(padding: EdgeInsetsGeometry.all(18), child: child),
    );
  }
}

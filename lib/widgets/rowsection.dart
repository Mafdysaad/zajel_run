import 'package:flutter/material.dart';

class Rowsection extends StatelessWidget {
  final String title, leading;
  const Rowsection({super.key, required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.grey.shade600),
          ),
        ),
        Text(
          leading,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF18202E),
          ),
        ),
      ],
    );
  }
}

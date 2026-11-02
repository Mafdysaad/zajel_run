import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hintText: 'رايح فين؟',
          prefixIcon: const Icon(Icons.search, color: Colors.orange, size: 28),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}

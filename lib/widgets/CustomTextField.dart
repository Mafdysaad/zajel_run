import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextEditingController? controller;

  const CustomTextField({
    super.key,
    required this.title,
    required this.icon,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: title,
          prefixIcon: Icon(icon),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.grey),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.blue, width: 1.5),
          ),
        ),
      ),
    );
  }
}

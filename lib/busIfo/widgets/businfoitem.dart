import 'package:flutter/material.dart';

class Businfoitem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const Businfoitem({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffEEEEEE), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            // Arrow
            const Icon(Icons.arrow_forward_ios, size: 17, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

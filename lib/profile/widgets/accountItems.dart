import 'package:flutter/material.dart';

class AccountMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const AccountMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xffEEEEEE), width: 1),
        ),
        child: Row(
          children: [
            // Icon Circle
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xffEAF1F3),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: const Color(0xff245966), size: 24),
            ),

            const SizedBox(width: 12),

            // Title
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

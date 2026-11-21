import 'package:flutter/material.dart';

class CustomRememberMe extends StatelessWidget {
  final bool rememberMe;
  final ValueChanged<bool?> onRememberChanged;
  final VoidCallback onForgotPasswordTap;

  const CustomRememberMe({
    super.key,
    required this.rememberMe,
    required this.onRememberChanged,
    required this.onForgotPasswordTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Checkbox(
                value: rememberMe,
                onChanged: onRememberChanged,
                activeColor: const Color(0xFF168B9A),
                side: const BorderSide(color: Colors.grey, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                visualDensity: VisualDensity.compact,
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Remember Me',
              style: TextStyle(fontSize: 15, color: Color(0xFF444444)),
            ),
          ],
        ),

        GestureDetector(
          onTap: onForgotPasswordTap,
          child: const Text(
            'Forgot Password',
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFF17677A),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

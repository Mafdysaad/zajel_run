import 'package:flutter/material.dart';

class CustomAgreementCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool?> onChanged;
  final VoidCallback onPrivacyTap;
  final VoidCallback onAgreementTap;

  const CustomAgreementCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
    required this.onPrivacyTap,
    required this.onAgreementTap,
  });

  @override
  Widget build(BuildContext context) {
    const linkStyle = TextStyle(
      color: Color(0xFF246775),
      fontSize: 14,
      fontWeight: FontWeight.w600,
      decoration: TextDecoration.underline,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 30,
          height: 30,
          child: Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF246775),
            side: const BorderSide(color: Colors.grey, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const Text(
                'I agree ',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              InkWell(
                onTap: onPrivacyTap,
                child: const Text('Privacy Policy', style: linkStyle),
              ),

              const Text(
                ' and ',
                style: TextStyle(fontSize: 14, color: Colors.black87),
              ),

              InkWell(
                onTap: onAgreementTap,
                child: const Text('User Agreement', style: linkStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/responsive_size.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

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
    final l10n = AppLocalizations.of(context)!;
    final linkStyle = TextStyle(
      color: Color(0xFF246775),
      fontSize: responsivesize(context, fontsize: 15),
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
              Text(
                l10n.iAgree,
                style: TextStyle(
                  fontSize: responsivesize(context, fontsize: 15),
                  color: Colors.black87,
                ),
              ),

              InkWell(
                onTap: onPrivacyTap,
                child: Text(l10n.privacyPolicy, style: linkStyle),
              ),

              Text(
                l10n.and,
                style: TextStyle(
                  fontSize: responsivesize(context, fontsize: 15),
                  color: Colors.black87,
                ),
              ),

              InkWell(
                onTap: onAgreementTap,
                child: Text(l10n.userAgreement, style: linkStyle),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

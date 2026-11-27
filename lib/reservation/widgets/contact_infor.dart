import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class ContactInfor extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.emailAddress,
                    style: Fontstyle.openSansRegular18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  'mafdysaad366@gamil.com',
                  style: Fontstyle.openSansBold15(context)
                      .copyWith(color: Color(0xFF18202E)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.phonenumber,
                    style: Fontstyle.openSansRegular18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '01022102989',
                  style: Fontstyle.openSansBold15(context)
                      .copyWith(color: Color(0xFF18202E)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class PaymentDetials extends StatelessWidget {
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
                    l10n.subtotal,
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '80 ${l10n.le}',
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
                    l10n.tax,
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '10 ${l10n.le}',
                  style: Fontstyle.openSansBold15(context)
                      .copyWith(color: Color(0xFF18202E)),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Dotted line
          Row(
            children: List.generate(
              30,
              (index) => Expanded(
                child: Container(
                  height: 1.5,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.total,
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '90 ${l10n.le}',
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

import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class PaymentDetials extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Subtotal",
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '80 LE',
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
                    "Tax",
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '10 LE',
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
                    "Total",
                    style: Fontstyle.openSansBold18(context)
                        .copyWith(color: Colors.grey.shade600),
                  ),
                ),
                Text(
                  '90 LE',
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

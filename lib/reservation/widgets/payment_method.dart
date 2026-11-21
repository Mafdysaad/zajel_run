import 'package:flutter/material.dart';

enum PaymentMethod { vodafone, orange, instapay }

class PaymentMethodDropdown extends StatefulWidget {
  final ValueChanged<PaymentMethod>? onChanged;

  const PaymentMethodDropdown({super.key, this.onChanged});

  @override
  State<PaymentMethodDropdown> createState() => _PaymentMethodDropdownState();
}

class _PaymentMethodDropdownState extends State<PaymentMethodDropdown> {
  PaymentMethod? selectedMethod = PaymentMethod.vodafone;

  String getMethodName(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.vodafone:
        return 'Vodafone Cash';
      case PaymentMethod.orange:
        return 'Orange Cash';
      case PaymentMethod.instapay:
        return 'InstaPay';
    }
  }

  Color getMethodColor(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.vodafone:
        return const Color(0xFFE60000);
      case PaymentMethod.orange:
        return const Color(0xFFFF7900);
      case PaymentMethod.instapay:
        return const Color(0xFF6B3FA0);
    }
  }

  String getMethodLogo(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.vodafone:
        return 'V';
      case PaymentMethod.orange:
        return 'O';
      case PaymentMethod.instapay:
        return 'I';
    }
  }

  Widget paymentIcon(PaymentMethod method) {
    return CircleAvatar(
      radius: 21,
      backgroundColor: const Color(0xFFF0F3F5),
      child: Text(
        getMethodLogo(method),
        style: TextStyle(
          color: getMethodColor(method),
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<PaymentMethod>(
      initialValue: selectedMethod,
      isExpanded: true,
      icon: const Icon(
        Icons.keyboard_arrow_down_rounded,
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8E8E8), width: 1.2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF00616D), width: 1.5),
        ),
      ),
      items: PaymentMethod.values.map((method) {
        return DropdownMenuItem<PaymentMethod>(
          value: method,
          child: Row(
            children: [
              paymentIcon(method),
              const SizedBox(width: 12),
              Flexible(
                child: Text(
                  getMethodName(method),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value == null) return;

        setState(() {
          selectedMethod = value;
        });

        widget.onChanged?.call(value);
      },
    );
  }
}

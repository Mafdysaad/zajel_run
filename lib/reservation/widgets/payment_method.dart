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

  String getMethodLogo(PaymentMethod method) {
    switch (method) {
      case PaymentMethod.vodafone:
        return 'assets/images/fodafon.png';
      case PaymentMethod.orange:
        return 'assets/images/orang.png';
      case PaymentMethod.instapay:
        return 'assets/images/instapay.png';
    }
  }

  Widget paymentIcon(PaymentMethod method, {double size = 55}) {
    return Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF0F3F5),
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(getMethodLogo(method), fit: BoxFit.contain),
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
        size: 30,
      ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 22,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: paymentIcon(method),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: Text(
                  getMethodName(method),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
      selectedItemBuilder: (context) {
        return PaymentMethod.values.map((method) {
          return Row(
            children: [
              paymentIcon(method),
              const SizedBox(width: 15),
              Text(
                getMethodName(method),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          );
        }).toList();
      },
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

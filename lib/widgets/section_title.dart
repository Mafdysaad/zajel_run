import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: Fontstyle.openSansBold23(context)),
      ),
    );
  }
}

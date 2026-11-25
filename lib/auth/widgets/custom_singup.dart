import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class Cusomsingup extends StatelessWidget {
  final Function() onTap;
  final String textone;
  final String textwo;
  const Cusomsingup({
    super.key,
    required this.onTap,
    required this.textone,
    required this.textwo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35, top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textone,
            textAlign: TextAlign.end,
            style: Fontstyle.openSansBold14(context)
                .copyWith(color: Colors.black),
          ),
          InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                textwo,
                style: Fontstyle.openSansBold15(context)
                    .copyWith(color: Color(0xFF17677A)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

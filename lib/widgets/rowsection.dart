import 'package:flutter/material.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';

class Rowsection extends StatelessWidget {
  final String title, leading;
  const Rowsection({super.key, required this.title, required this.leading});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: Fontstyle.openSansRegular14(context)
                .copyWith(color: Colors.grey.shade600),
          ),
        ),
        Text(
          leading,
          style: Fontstyle.openSansSemiBold14(context)
              .copyWith(color: Color(0xFF18202E)),
        ),
      ],
    );
  }
}

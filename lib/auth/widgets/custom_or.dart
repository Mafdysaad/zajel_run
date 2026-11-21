import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';

class CustomOR extends StatelessWidget {
  const CustomOR({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 15),
      child: Row(
        children: [
          const Expanded(
            flex: 2,
            child: Divider(
              color: Color(ColorsApp.backgroundIcon),
              indent: 15,
              endIndent: 15,
              thickness: 3,
            ),
          ),
          Text(
            'Or Continue With',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Expanded(
            flex: 2,
            child: Divider(
              color: Color(ColorsApp.backgroundIcon),
              thickness: 3,
              indent: 10,
              endIndent: 10,
            ),
          ),
        ],
      ),
    );
  }
}

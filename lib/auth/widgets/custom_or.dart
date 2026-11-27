import 'package:flutter/material.dart';
import 'package:zajel_run/core/const/colors/colors_app.dart';
import 'package:zajel_run/core/utils/fontStryle.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class CustomOR extends StatelessWidget {
  const CustomOR({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
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
            l10n.orContinueWith,
            style: Fontstyle.openSansBold19(context)
                .copyWith(color: Colors.black),
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

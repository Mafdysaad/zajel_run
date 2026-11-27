import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/core/utils/fontStryle.dart' show Fontstyle;
import 'package:zajel_run/homepage/widgets/notifiction_icon.dart';
import 'package:zajel_run/l10n/app_localizations.dart';
import 'package:zajel_run/profile/widgets/custom_Avatar%20copy.dart';
import 'package:zajel_run/widgets/circuleshap.dart';

class Customappbar extends StatelessWidget {
  const Customappbar({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SizedBox(
      height: 90,
      child: Row(
        children: [
          CustomAvatar(),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  l10n.goodMorning,
                  style: Fontstyle.openSansBold18(context),
                ),
              ),
              SizedBox(height: 3),
              Expanded(
                child: Text(
                  "Mafdy Saad",
                  style: Fontstyle.openSansBold14(context),
                ),
              ),
            ],
          ),
          Spacer(),
          NotificationIcon(
            count: 2,
            onPressed: () {
              context.push(Approutes.kNotifictionScreen);
            },
          ),
        ],
      ),
    );
  }
}

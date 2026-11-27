import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:zajel_run/core/utils/approutes.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      supportedLocales: const [Locale('ar'), Locale('en')],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: null,
      routerConfig: Approutes.routes,
      title: 'Flutter Demo',

      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: MediaQuery.of(context).textScaler
                .clamp(minScaleFactor: 1.0, maxScaleFactor: 1.5),
          ),
          child: child!,
        );
      },
    );
  }
}

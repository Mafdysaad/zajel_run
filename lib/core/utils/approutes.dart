import 'package:go_router/go_router.dart';
import 'package:zajel_run/app.dart';
import 'package:zajel_run/auth/forgetpassword.dart';
import 'package:zajel_run/auth/login.dart';
import 'package:zajel_run/auth/sinup.dart';
import 'package:zajel_run/auth/verify_account.dart';
import 'package:zajel_run/homepage/notifiction_screen.dart';
import 'package:zajel_run/homepage/widgets/notifictionModel.dart';
import 'package:zajel_run/splash/splash.dart';
import 'package:zajel_run/ticket/widgets/ticetdatiels.dart';

abstract class Approutes {
  static String kHomeRoute = '/homepage';
  static String kTicetdatiels = '/kTicetdatiels';
  static String kNotifictionScreen = '/KnotifictionScreen';
  static String kSinup = '/sinup';
  static String kLogin = '/Login';
  static String kForgetpassword = '/Forgetpassword';
  static String kverifyAccount = '/verifyAccount';
  // GetIt getIt = GetIt.instance;
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const Splash()),
      GoRoute(path: kHomeRoute, builder: (context, state) => const App()),
      GoRoute(path: kSinup, builder: (context, state) => const Sinup()),
      GoRoute(path: kLogin, builder: (context, state) => const LoginPage()),
      GoRoute(
        path: kNotifictionScreen,
        builder: (context, state) => NotificationsScreen(
          notifications: [
            AppNotification(
              id: 1,
              title: "الباص على وصول",
              body: 'الباص على قرب منك على مسافه 1 كيلو ميتر ',
              date: '12/11/2026',
            ),
            AppNotification(
              id: 2,
              title: "الباص على وصول",
              body: 'الباص على قرب منك على مسافه 1 كيلو ميتر ',
              date: '12/11/2026',
            ),
            AppNotification(
              id: 3,
              title: "الباص على وصول",
              body: 'الباص على قرب منك على مسافه 1 كيلو ميتر ',
              date: '12/11/2026',
            ),
          ],
        ),
      ),
      GoRoute(
        path: kTicetdatiels,
        builder: (context, state) => const Ticetdatiels(),
      ),
      GoRoute(
        path: kForgetpassword,
        builder: (context, state) => const Forgetpassword(),
      ),
      GoRoute(
        path: kverifyAccount,
        builder: (context, state) => const VerifyAccount(),
      ),
    ],
  );
}

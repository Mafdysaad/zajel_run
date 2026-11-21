import 'package:go_router/go_router.dart';
import 'package:zajel_run/app.dart';
import 'package:zajel_run/auth/login.dart';
import 'package:zajel_run/auth/sinup.dart';
import 'package:zajel_run/homepage/homepage.dart';
import 'package:zajel_run/splash/splash.dart';

abstract class Approutes {
  static String kHomeRoute = '/homepage';
  static String kBookDetails = '/bookdetails';
  static String kSinup = '/sinup';
  static String kLogin = '/Login';
  // GetIt getIt = GetIt.instance;
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(path: kHomeRoute, builder: (context, state) => const App()),
      GoRoute(path: kSinup, builder: (context, state) => const Sinup()),
      GoRoute(path: kLogin, builder: (context, state) => const LoginPage()),
    ],
  );
}

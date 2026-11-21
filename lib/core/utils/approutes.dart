import 'package:go_router/go_router.dart';
import 'package:zajel_run/app.dart';
import 'package:zajel_run/auth/forgetpassword.dart';
import 'package:zajel_run/auth/login.dart';
import 'package:zajel_run/auth/sinup.dart';
import 'package:zajel_run/auth/verify_account.dart';

abstract class Approutes {
  static String kHomeRoute = '/homepage';
  static String kBookDetails = '/bookdetails';
  static String kSinup = '/sinup';
  static String kLogin = '/Login';
  static String kForgetpassword = '/Forgetpassword';
  static String kverifyAccount = '/verifyAccount';
  // GetIt getIt = GetIt.instance;
  static GoRouter routes = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const LoginPage()),
      GoRoute(path: kHomeRoute, builder: (context, state) => const App()),
      GoRoute(path: kSinup, builder: (context, state) => const Sinup()),
      GoRoute(path: kLogin, builder: (context, state) => const LoginPage()),
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

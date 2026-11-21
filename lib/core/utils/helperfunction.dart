import 'package:go_router/go_router.dart';
import 'package:zajel_run/core/utils/approutes.dart';

void transition(context) {
  Future.delayed(const Duration(seconds: 4), () {
    // Get.to(const Home(), transition: Transition.fadeIn);
    GoRouter.of(context).push(Approutes.kHomeRoute);
  });
}

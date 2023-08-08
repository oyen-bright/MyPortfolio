import 'package:go_router/go_router.dart';
import 'package:my_portfolio/view/experince/experiences.dart';

class AppRoutes {
  static const home = "/";
  static const experience = "/experience";

  static final routes = GoRouter(routes: [
    GoRoute(path: home, builder: (_, state) => const Experiences())
  ]);
}

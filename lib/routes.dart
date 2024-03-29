import 'package:go_router/go_router.dart';
import 'package:my_portfolio/view/about/about.dart';
import 'package:my_portfolio/view/contact/contact.dart';
import 'package:my_portfolio/view/experince/experiences.dart';
import 'package:my_portfolio/view/projects/project.dart';
import 'package:my_portfolio/view/skills/skills.dart';

class AppRoutes {
  static const home = "/";
  static const experience = "/experience";
  static const contact = "/contact";
  static const skills = "/skills";
  static const projects = "/projects";
  static const about = "/about";

  static final routes = GoRouter(routes: [
    GoRoute(path: home, builder: (_, state) => const Experiences()),
    GoRoute(path: contact, builder: (_, state) => const ContactMe()),
    GoRoute(path: skills, builder: (_, state) => const MySkills()),
    GoRoute(path: about, builder: (_, state) => const About()),
    GoRoute(path: projects, builder: (_, state) => const MyProjects())
  ]);
}

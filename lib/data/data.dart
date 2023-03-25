import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/projects.dart';
import 'package:my_portfolio/models/skills.dart';
import 'package:my_portfolio/models/social_media.dart';

import '../models/package.dart';

final List<SocialMedia> socialMediaLinks = [
  const SocialMedia(
      toolTip: "Check out my repositries on GitHub",
      name: FontAwesomeIcons.github,
      link: 'https://github.com/oyen-bright'),
  const SocialMedia(
      toolTip: "Check out my repositries on GitHub",
      name: FontAwesomeIcons.linkedin,
      link: 'http://linkedin.com/in/kelvinatemiehart'),
  const SocialMedia(
      toolTip: "Check out my Instagram page",
      name: FontAwesomeIcons.instagram,
      link: 'http://linkedin.com/in/kelvinatemiehart'),
  const SocialMedia(
      toolTip: "Check out my Twitter Feed",
      name: FontAwesomeIcons.twitter,
      link: 'https://www.twitter.com/kelvin5hart'),
];

List<Projects> projects = [
  Projects(
      imageString: "assets/projects/Project2.png",
      projectName: "CinemaNinja",
      gitlink: "https://linktr.ee/cinemaninja",
      typeOfProject: "Open Source",
      projectDescription:
          "An app created with me, An app created with me An app created with me An app created with me"),
  Projects(
      imageString: "assets/projects/Project3.png",
      projectName: "Social Media App",
      gitlink: "https://github.com/kelvin5hart/day_5_in_100_days_of_flutter",
      typeOfProject: "Practice/Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project4.png",
      projectName: "Workout App",
      gitlink: "https://github.com/kelvin5hart/day_6_in_100_days_of_flutter",
      typeOfProject: "Practice/Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project5.png",
      projectName: "Travel Guide App",
      gitlink: "https://github.com/kelvin5hart/day_4_in_100_days_of_flutter",
      typeOfProject: "Practice/Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project6.png",
      projectName: "Todo App",
      gitlink: "https://github.com/kelvin5hart/day_2_in_100_days_of_flutter",
      typeOfProject: "Practice/Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project7.png",
      projectName: "NFT Collection App",
      gitlink: "https://github.com/kelvin5hart/day_1_in_100_days_of_flutter",
      typeOfProject: "Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project8.png",
      projectName: "Health Care App",
      gitlink: "https://github.com/kelvin5hart/MedApp",
      typeOfProject: "Open Source",
      projectDescription: "An app created with me"),
  Projects(
      imageString: "assets/projects/Project9.png",
      projectName: "Workout App",
      gitlink: "https://github.com/kelvin5hart/my_workout",
      typeOfProject: "Open Source",
      projectDescription: "An app created with me"),
  // Projects(
  //     imageString: "assets/projects/Project10.png",
  //     projectName: "Smart Home App",
  //     typeOfProject: "Open Source",
  //     projectDescription: "An app created with me"),
];

List<Packages> packages = [
  Packages(
      title: "sizedbox_extention",
      version: "0.0.2",
      body:
          "A Flutter package allows you to put empty space between widgets without using a Container or SizedBox widget.",
      url: "https://pub.dev/packages/sizedbox_extention"),
  Packages(
      title: "flutter_loading_appbar",
      version: "0.0.1",
      body:
          "A Flutter package for showing a linear progress indicator under the Appbar.",
      url: "https://pub.dev/packages/flutter_loading_appbar"),
  Packages(
      title: "flutter_numpad",
      version: "0.0.1",
      body: "A flutter Package for Numpad layout on screen.",
      url: "https://pub.dev/packages/flutter_numpad"),
];

List<Skills> skills = [
  Skills(
      imageString: "assets/logos/FlutterLogo.png",
      skillName: "Flutter",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/DartLogo.png",
      skillName: "Dart",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/FirebaseLogo.png",
      skillName: "Firebase",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/python-original.png",
      skillName: "python",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/django.png",
      skillName: "django",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/android-original-wordmark.png",
      skillName: "Android",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/swift-original.png",
      skillName: "Swift",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/java-original.png",
      skillName: "Java",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/javascript-original.png",
      skillName: "JavaScript",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/html5-original-wordmark.png",
      skillName: "HTML",
      yearsOfExperience: "2"),
  Skills(
      imageString: "assets/logos/css3-original-wordmark.png",
      skillName: "CSS",
      yearsOfExperience: "2"),
];

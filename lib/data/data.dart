import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/models/projects.dart';
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
      title: "fsizedbox_extention",
      version: "0.0.2",
      body:
          "FA Flutter package allows you to put empty space between widgets without using a Container or SizedBox widget.",
      url: "https://pub.dev/packages/sizedbox_extention"),
  Packages(
      title: "flutter_loading_appbar",
      version: "0.0.1",
      body:
          "Futter loading is a package that allows your to add liner progress indicator under the app bar,",
      url: "https://pub.dev/packages/flutter_loading_appbar"),
  Packages(
      title: "flutter_numpad",
      version: "0.0.1",
      body:
          "Futter numpad is a package that allows your to add liner progress indicator under the app bar,",
      url: "https://pub.dev/packages/flutter_numpad"),
];

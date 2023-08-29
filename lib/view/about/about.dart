import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/view/about/components/my_story_text.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
      items: [
        HeaderWrapper(
            web: Row(
          children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.only(left: 50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    "I specialize in building high quality mobile & web applications.",
                    style: context.theme.textTheme.titleLarge!
                        .copyWith(fontSize: 50, fontWeight: FontWeight.normal),
                  ),
                  40.height,
                  AutoSizeText(
                    "I also have a strong passion for opensource work.",
                    style: context.theme.textTheme.titleLarge!
                        .copyWith(fontSize: 50, fontWeight: FontWeight.normal),
                  )
                ],
              ),
            )),
            Expanded(
                child: Container(
              child: const MyImageWidget(),
            ))
          ],
        )),
        200.height,
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: Constants.kMarginDesktop),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SectionHeader(
                subtitle: "A little bit about myself.",
                title: "Story",
                titleBarBackgroundColor: context.theme.primaryColor,
                subtitleBarBackgroundColor: context.theme.colorScheme.secondary,
              ),
              60.width,
              const Expanded(child: IntroductionText())
            ],
          ),
        ),
        200.height,
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: Constants.kMarginDesktop),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SectionHeader(
                subtitle: "What i use.",
                title: "Technology",
                titleBarBackgroundColor: context.theme.primaryColor,
                subtitleBarBackgroundColor: context.theme.colorScheme.secondary,
              ),
              60.width,
              const Expanded(child: IntroductionText())
            ],
          ),
        ),
        200.height,
        Container(
          padding:
              const EdgeInsets.symmetric(horizontal: Constants.kMarginDesktop),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SectionHeader(
                subtitle: "Socials.",
                title: "Contact",
                titleBarBackgroundColor: context.theme.primaryColor,
                subtitleBarBackgroundColor: context.theme.colorScheme.secondary,
              ),
              60.width,
              Expanded(
                  child: Wrap(
                spacing: 30,
                runSpacing: 39,
                children: const [
                  SocialLink(icon: FontAwesomeIcons.linkedin, text: 'LinkedIn'),
                  SocialLink(icon: FontAwesomeIcons.inbox, text: 'Email'),
                  SocialLink(icon: FontAwesomeIcons.twitter, text: 'Twitter'),
                  SocialLink(
                      icon: FontAwesomeIcons.instagram, text: 'Instagram'),
                ],
              ))
            ],
          ),
        ),
        const Footer()
      ],
    );
  }
}

class MyImageWidget extends StatefulWidget {
  const MyImageWidget({super.key});

  @override
  _MyImageWidgetState createState() => _MyImageWidgetState();
}

class _MyImageWidgetState extends State<MyImageWidget> {
  double rotationAngle = 0.0;

  void updateRotationAngle(Offset pointerPosition, Offset imageCenter) {
    double dx = pointerPosition.dx - imageCenter.dx;
    double dy = pointerPosition.dy - imageCenter.dy;
    double radians = atan2(dy, dx);
    setState(() {
      rotationAngle = radians * 180 / pi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MouseRegion(
        onHover: (event) {
          updateRotationAngle(event.localPosition,
              const Offset(100, 100)); // Replace with your image center
        },
        child: Center(
          child: Transform.rotate(
            angle: rotationAngle * pi / 180,
            child: Image.asset(
              "assets/ppp2.png",
              scale: 5.5,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class SocialLink extends StatefulWidget {
  final IconData icon;
  final String text;

  const SocialLink({super.key, required this.icon, required this.text});

  @override
  _SocialLinkState createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Implement the action to perform when the link is clicked.
      },
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            _isHovered = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Icon(widget.icon),
              const SizedBox(width: 8),
              Text(
                widget.text,
                style: TextStyle(
                  decoration: _isHovered
                      ? TextDecoration.underline
                      : TextDecoration.none,
                  color: _isHovered ? Colors.blue : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

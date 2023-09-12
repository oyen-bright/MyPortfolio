// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/widgets/buttons/animated_button.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../../widgets/buttons/animated_down_arrow.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({super.key});

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {
  late final ItemPositionsListener itemPositionsListener;

  @override
  void initState() {
    super.initState();
    itemPositionsListener = ItemPositionsListener.create();
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(itemPositionsListener: itemPositionsListener, items: [
      SizedBox(
        width: double.infinity,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            HeaderWrapper(
              web: FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  color: context.theme.scaffoldBackgroundColor.withOpacity(0.3),
                  child: AnimatedTextKit(
                    stopPauseOnTap: true,
                    pause: Constants.kAnimationDuration,
                    displayFullTextOnTap: true,
                    totalRepeatCount: 1,
                    repeatForever: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        "Projects",
                        textStyle: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(shadows: [
                          Shadow(
                            color:
                                Colors.black.withOpacity(0.2), // Shadow color
                            blurRadius: 5, // Shadow blur radius
                            offset: const Offset(0, 2), // Shadow offset
                          ),
                        ]),
                        textAlign: TextAlign.center,
                        speed: Constants.kTypeWriterSpeed,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const AnimatedDownwardArrow()
          ],
        ),
      ),
      SizedBox(
        width: double.infinity,
        child: Center(
          child: ScreenTypeLayout.builder(mobile: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginMobile,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  150.height,
                  Padding(
                    padding: const EdgeInsets.only(left: 29.5),
                    child: _screenHeader(context),
                  ),
                  _experienceTimeline()
                ],
              ),
            );
          }, desktop: (context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kMarginDesktop),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _screenHeader(context),
                  60.width,
                  _experienceTimeline()
                ],
              ),
            );
          }),
        ),
      ),
      const Footer()
    ]);
  }

  Widget _experienceTimeline() {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Transform.rotate(
              angle: Constants
                  .kRotateAngle, // Adjust the angle as needed to achieve the desired bend
              child: Container(
                height: 510,
                width: double.infinity,
                decoration: BoxDecoration(border: Border.all()),
                child: Transform.rotate(
                  angle: -(Constants.kRotateAngle),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: context.theme.primaryColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              20.height,
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.pink,
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                              5.height,
                              Text(
                                "Lufthansa Experience",
                                style: context.theme.textTheme.titleMedium,
                              ),
                              5.height,
                              Text(
                                "Bringing a Corporate Identity to New Life",
                                style: context.theme.textTheme.headlineMedium,
                              ),
                              10.height,
                              Expanded(
                                child: AutoSizeText(
                                  '''In efforts to rebrand and redesign its corporate identity, Lufthansa adopted a new logo and corporate design in early 2018. The Lufthansa Experience app for iPad includes a range of engaging animations that brings the new Lufthansa CI to life beyond the logo, allowing users to explore the new clothing and interior design of the airplanes.''',
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                              ),
                              10.height,
                              const AnimatedButton(title: "More Info")
                            ],
                          ),
                        )),
                        Expanded(child: Container())
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  SectionHeader _screenHeader(BuildContext context) {
    return SectionHeader(
      subtitle: "My work experiences",
      title: "Where I've worked",
      titleBarBackgroundColor: context.theme.primaryColor,
      subtitleBarBackgroundColor: context.theme.colorScheme.secondary,
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/view/experince/components/timeline.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../../widgets/buttons/animated_down_arrow.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
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
                        "Experience",
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
        height: context.height,
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

  ExperienceTimeline _experienceTimeline() {
    return ExperienceTimeline(itemPositionsListener: itemPositionsListener);
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

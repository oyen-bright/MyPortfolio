import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/util.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../constants.dart';
import '../../widgets/buttons/animated_down_arrow.dart';

class MySkills extends StatefulWidget {
  const MySkills({super.key});

  @override
  State<MySkills> createState() => _MySkillsState();
}

class _MySkillsState extends State<MySkills> {
  @override
  Widget build(BuildContext context) {
    return ViewWrapper(items: [
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
                        "--Skills--",
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
                children: const [
                  // 150.height,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 29.5),
                  //   child: _screenHeader(context),
                  // ),
                  // _experienceTimeline()
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
                  SectionHeader(
                    subtitle: "Some Technologies i've worked with",
                    title: "My Skills",
                    titleBarBackgroundColor: context.theme.primaryColor,
                    subtitleBarBackgroundColor:
                        context.theme.colorScheme.secondary,
                  )
                  // 60.width,
                  // _experienceTimeline()
                ],
              ),
            );
          }),
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
                children: const [
                  // 150.height,
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 29.5),
                  //   child: _screenHeader(context),
                  // ),
                  // _experienceTimeline()
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
                  SectionHeader(
                    subtitle: "Some Packages i've developed",
                    title: "Packages",
                    titleBarBackgroundColor: context.theme.primaryColor,
                    subtitleBarBackgroundColor:
                        context.theme.colorScheme.secondary,
                  ),
                  60.width,
                  const Expanded(child: Packages())
                ],
              ),
            );
          }),
        ),
      ),
      const Footer()
    ]);
  }
}

class Packages extends StatefulWidget {
  const Packages({super.key});

  @override
  State<Packages> createState() => _PackagesState();
}

class _PackagesState extends State<Packages> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("skills-packages-key"),
      onVisibilityChanged: (info) {
        var visibleFraction = info.visibleFraction;

        if (visibleFraction < 1.0) {
          if (!isVisible) {
            setState(() {
              isVisible = true;
            });
          }
        }
      },
      child: !isVisible
          ? const SizedBox(
              height: 300,
              width: 350,
            )
          : Wrap(
              children: AnimateList(
                  interval: 3.seconds,
                  delay: 3.seconds,
                  effects: [const FadeEffect()],
                  children: List.generate(
                      Data.packages.length,
                      (index) => Card(
                            child: SizedBox(
                              height: 300,
                              width: 350,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: const FadeInImage(
                                            placeholder: AssetImage(
                                                "assets/logos/packages-icon-20694.png"),
                                            image: AssetImage(
                                              "assets/logos/pub-dev-logo-2x.png",
                                            ))),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        AutoSizeText(
                                          Data.packages[index].title,
                                          style: context
                                              .theme.textTheme.titleMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        10.height,
                                        Text(Data.packages[index].body,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: context
                                                .theme.textTheme.bodyMedium),
                                      ],
                                    ),
                                  ),
                                  ButtonTheme(
                                    child: ButtonBar(
                                      children: <Widget>[
                                        TextButton(
                                            child: const Text('More Info'),
                                            onPressed: () => Util.lunchUrl(
                                                Data.packages[index].url)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )))),
    );
  }
}

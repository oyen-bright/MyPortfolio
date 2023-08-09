// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/view/header/components/social_media_widget.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
        child: HeaderWrapper(
          web: Container(),
        ),
      ),
      SizedBox(
        height: context.height,
        width: double.infinity,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginDesktop),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SectionHeader(),
                60.width,
                ExperienceTimeline(itemPositionsListener: itemPositionsListener)
              ],
            ),
          ),
        ),
      ),
      RotatedBox(
        quarterTurns: 2,
        child: Container(
          height: context.height < Constants.kMinHeight
              ? (Constants.kMinHeight)
              : context.height / 1.5,
          decoration: BoxDecoration(
              // color: context.theme.colorScheme.onSecondary,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  opacity: 0.1,
                  image: AssetImage(Data.headerData['background_image']))),
          child: RotatedBox(
            quarterTurns: -2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(
                  flex: 2,
                ),
                Text(
                  "Lets Work together.",
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.displayMedium!.copyWith(
                    shadows: [
                      Shadow(
                        color: Colors.black.withOpacity(0.2), // Shadow color
                        blurRadius: 5, // Shadow blur radius
                        offset: const Offset(0, 2), // Shadow offset
                      ),
                    ],
                  ),
                ),
                40.height,
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: context.theme.scaffoldBackgroundColor,
                  child: Text(
                    "Whether you have an idea for a project or just want to chat, feel free to shoot me an email!",
                    textAlign: TextAlign.center,
                    style: context.theme.textTheme.bodyMedium,
                  ),
                ),
                30.height,
                const AnimatedButton(),
                30.height,
                SocialMediaIconsWidget(
                  socialMediaLinks: Data.socialMediaLinks,
                ),
                const Spacer(),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    color: context.theme.scaffoldBackgroundColor,
                    child: const Text("© Brinnixs 2020")),
                40.height,
              ],
            ),
          ),
        ),
      )
    ]);
  }
}

class AnimatedButton extends StatefulWidget {
  const AnimatedButton({
    super.key,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _textAndIconColor;
  late AnimationController _controller;

  bool _isHovering = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: 200.milliseconds,
    );
    _textAndIconColor = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _controller.forward();
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _controller.reverse();
          _isHovering = false;
        });
      },
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent.withOpacity(0.38),
            disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(side: BorderSide()),
            padding: EdgeInsets.zero),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: AnimatedContainer(
                width: _isHovering ? context.width : 0,
                duration: 200.milliseconds,
                color: Colors.black,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'SAY HELLO',
                style: context.theme.textTheme.bodyLarge!
                    .copyWith(color: _textAndIconColor.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceTimeline extends StatefulWidget {
  const ExperienceTimeline({
    super.key,
    required this.itemPositionsListener,
  });

  final ItemPositionsListener itemPositionsListener;

  @override
  State<ExperienceTimeline> createState() => _ExperienceTimelineState();
}

class _ExperienceTimelineState extends State<ExperienceTimeline> {
  bool canScroll = false;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    widget.itemPositionsListener.itemPositions.addListener(() {
      final positions = widget.itemPositionsListener.itemPositions.value;
      for (var position in positions) {
        if (position.itemLeadingEdge < 0.08 &&
            position.itemTrailingEdge > 0.5) {
          if (position.index == 1) {
            if (!canScroll) {
              setState(() {
                canScroll = true;
              });
            }
          }
        } else {
          if (canScroll) {
            setState(() {
              canScroll = false;
            });
          }
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = [
      {
        "company_name": "Velvet Technology",
        "job_title": "Velvet Technology",
        "location": "Velvet Technology",
        "duration": "Velvet Technology",
        "bullet_point": ["point number1", "point number 2"]
      },
      {
        "company_name": "Velvet Technology",
        "job_title": "Velvet Technology",
        "location": "Velvet Technology",
        "duration": "Velvet Technology",
        "bullet_point": ["point number1", "point number 2"]
      },
      {
        "company_name": "Velvet Technology",
        "job_title": "Velvet Technology",
        "location": "Velvet Technology",
        "duration": "Velvet Technology",
        "bullet_point": ["point number1", "point number 2"]
      },
      {
        "company_name": "Velvet Technology",
        "job_title": "Velvet Technology",
        "location": "Velvet Technology",
        "duration": "Velvet Technology",
        "bullet_point": ["point number1", "point number 2"]
      }
    ];
    return Flexible(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: Timeline(
          controller: _scrollController,
          physics: canScroll ? null : const NeverScrollableScrollPhysics(),
          children: data
              .map(
                (e) => TimelineModel(
                  Builder(builder: (context) {
                    bool hovered = data.indexOf(e) == 0 ? true : false;
                    return StatefulBuilder(builder: (context, setState) {
                      return MouseRegion(
                        onEnter: (_) => setState(() {
                          hovered = true;
                        }),
                        onExit: (_) => setState(() => hovered = false),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: VisibilityDetector(
                            onVisibilityChanged: (info) {
                              var visibleFraction = info.visibleFraction;

                              if (visibleFraction < 1.0 &&
                                  data.indexOf(e) != data.length - 1) {
                                _scrollController.animateTo(
                                  _scrollController.position
                                      .maxScrollExtent, // Scroll to the bottom
                                  duration: 500.milliseconds,
                                  curve: Curves.bounceIn,
                                );
                              }
                            },
                            key: Key(data.indexOf(e).toString()),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  AnimatedContainer(
                                    duration: 2.seconds,
                                    child: AnimatedDefaultTextStyle(
                                      duration: 500.milliseconds,
                                      curve: Curves.fastOutSlowIn,
                                      style: hovered
                                          ? context
                                              .theme.textTheme.headlineMedium!
                                          : context.theme.textTheme.titleLarge!,
                                      child: const Text(
                                        "Velvet Technologies",
                                      ),
                                    ),
                                  ),
                                  2.height,
                                  Text(
                                    "Mobile/Front-End Engineer",
                                    style: hovered
                                        ? context.theme.textTheme.titleLarge
                                        : context.theme.textTheme.titleMedium!,
                                  ),
                                  2.height,
                                  Text(
                                    "South Africa",
                                    style: hovered
                                        ? context.theme.textTheme.bodyLarge
                                        : context.theme.textTheme.bodySmall!,
                                  ),
                                  2.height,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(Icons.arrow_right_outlined),
                                      Flexible(
                                        child: Text(
                                            "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                            style: hovered
                                                ? context
                                                    .theme.textTheme.bodyMedium
                                                : context.theme.textTheme
                                                    .bodySmall!),
                                      ),
                                    ],
                                  ),
                                  2.height,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(Icons.arrow_right_outlined),
                                      Flexible(
                                        child: Text(
                                            "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                            style: hovered
                                                ? context
                                                    .theme.textTheme.bodyMedium
                                                : context.theme.textTheme
                                                    .bodySmall!),
                                      ),
                                    ],
                                  ),
                                  2.height,
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      const Icon(Icons.arrow_right_outlined),
                                      Flexible(
                                        child: Text(
                                            "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                            style: hovered
                                                ? context
                                                    .theme.textTheme.bodyMedium
                                                : context.theme.textTheme
                                                    .bodySmall!),
                                      ),
                                    ],
                                  ),
                                ].animate(
                                    interval: 3.seconds,
                                    effects: [const FadeEffect()])),
                          ),
                        ),
                      );
                    });
                  }).animate().slideY(curve: Curves.bounceOut),
                  position: TimelineItemPosition.right,
                  icon: const Icon(Icons.receipt, color: Colors.white),
                  iconBackground: Colors.blue,
                ),
              )
              .toList(),
          position: TimelinePosition.Left,
          iconSize: 40,
          lineColor: Colors.blue,
        ),
      ),
    );
  }
}

class SectionHeader extends StatefulWidget {
  const SectionHeader({
    Key? key,
  }) : super(key: key);
  @override
  State<SectionHeader> createState() => _SectionHeaderState();
}

class _SectionHeaderState extends State<SectionHeader>
    with SingleTickerProviderStateMixin {
  bool animateText = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: const Key("section-header"),
      onVisibilityChanged: (VisibilityInfo info) {
        var visibleFraction = info.visibleFraction;

        if (visibleFraction == 1.0) {
          if (!animateText) {
            setState(() {
              animateText = true;
            });
          }
        }
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 30,
                  width: 5,
                  color: Colors.blue,
                ),

                // DefaultTextStyle(
                //   style: const TextStyle(),
                //   child: AnimatedTextKit(
                //     totalRepeatCount: 1,
                //     animatedTexts: [TyperAnimatedText("My work experiences")],
                //   ),
                // )
                const Text("My work experiences")
              ],
            ),
            // inherits duration from fadeIn
            // runs after the above w/new duration

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 10),
                  height: 60,
                  width: 5,
                  color: Colors.red,
                ),
                if (animateText)
                  DefaultTextStyle(
                    style: const TextStyle(
                      fontSize: 30,
                    ),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText("Where I've worked",
                            speed: Constants.kTypeWriterSpeedSlow,
                            curve: Curves.easeOut)
                      ],
                    ),
                  )
              ],
            )
          ]),
    );
  }
}

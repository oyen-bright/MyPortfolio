import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
  bool isVisible = false;
  late final Timer _timer;
  late final ScrollController _scrollController;

  List<Map<String, Object>> displayData = [];

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

    int i = 0;
    List data = [
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

    // displayData.add(data.removeAt(0));

    _timer = Timer.periodic(Constants.kTypeWriterSpeedSlow, (timer) {
      if (isVisible) {
        if (data.isEmpty) {
          _timer.cancel();
        } else {
          setState(() {
            displayData.add(data.removeAt(0));
          });
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
    return Flexible(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: VisibilityDetector(
          key: const Key("experience-timeline-key"),
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
          child: Timeline(
            controller: _scrollController,
            // physics: canScroll ? null : const NeverScrollableScrollPhysics(),
            children: !isVisible
                ? []
                : displayData
                    .map(
                      (e) => TimelineModel(
                          Builder(builder: (context) {
                            bool hovered =
                                displayData.indexOf(e) == 0 ? true : false;
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return MouseRegion(
                                onEnter: (_) => setState(() {
                                  hovered = true;
                                }),
                                onExit: (_) => setState(() => hovered = false),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 30, left: 20),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        AnimatedContainer(
                                          duration: 2.seconds,
                                          child: AnimatedDefaultTextStyle(
                                            duration: 500.milliseconds,
                                            curve: Curves.fastOutSlowIn,
                                            style: hovered
                                                ? context.theme.textTheme
                                                    .headlineMedium!
                                                : context.theme.textTheme
                                                    .titleLarge!,
                                            child: const Text(
                                              "Velvet Technologies",
                                            ),
                                          ),
                                        ),
                                        2.height,
                                        Text(
                                          "Mobile/Front-End Engineer",
                                          style: hovered
                                              ? context
                                                  .theme.textTheme.titleLarge
                                              : context
                                                  .theme.textTheme.titleMedium!,
                                        ),
                                        2.height,
                                        Text(
                                          "South Africa",
                                          style: hovered
                                              ? context
                                                  .theme.textTheme.bodyMedium
                                              : context
                                                  .theme.textTheme.bodySmall!,
                                        ),
                                        2.height,
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            const Icon(
                                                Icons.arrow_right_outlined),
                                            Flexible(
                                              child: Text(
                                                  "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                                  style: hovered
                                                      ? context.theme.textTheme
                                                          .bodyMedium!
                                                      : context.theme.textTheme
                                                          .bodySmall!),
                                            ),
                                          ],
                                        ),
                                      ].animate(
                                          interval:
                                              Constants.kTypeWriterSpeedSlow,
                                          effects: [const FadeEffect()])),
                                ),
                              );
                            });
                          }).animate().slideY(curve: Curves.bounceOut),
                          position: TimelineItemPosition.right,
                          icon: const Icon(Icons.work_outline,
                              color: Colors.white),
                          iconBackground: context.theme.primaryColor),
                    )
                    .toList(),
            position: TimelinePosition.Left,
            iconSize: 40,
            // lineColor: Colors.blue,
          ),
        ),
      ),
    );
  }
}

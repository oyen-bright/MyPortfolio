// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SectionHeader extends StatefulWidget {
  final Color titleBarBackgroundColor;
  final Color subtitleBarBackgroundColor;
  final String title;
  final String subtitle;
  const SectionHeader({
    Key? key,
    required this.titleBarBackgroundColor,
    required this.subtitleBarBackgroundColor,
    required this.title,
    required this.subtitle,
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
                  color: widget.subtitleBarBackgroundColor,
                ),
                Text(
                  widget.subtitle,
                  style: context.theme.textTheme.bodyLarge,
                )
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
                  color: widget.titleBarBackgroundColor,
                ),
                if (animateText)
                  DefaultTextStyle(
                    style: context.theme.textTheme.headlineMedium!,
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      animatedTexts: [
                        TyperAnimatedText(widget.title,
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

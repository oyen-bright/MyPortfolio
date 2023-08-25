import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:visibility_detector/visibility_detector.dart';

class SkillsSection extends StatefulWidget {
  const SkillsSection({
    Key? key,
  }) : super(key: key);

  @override
  State<SkillsSection> createState() => _SkillsSectionState();
}

class _SkillsSectionState extends State<SkillsSection> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
        key: const Key("skills-skills-key"),
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
                height: 400,
              )
            : Wrap(
                runSpacing: 40,
                spacing: 20,
                children: AnimateList(
                    interval: 100.milliseconds,
                    effects: [const SlideEffect(curve: Curves.bounceOut)],
                    children: List.generate(Data.skills.length, (index) {
                      final data = Data.skills[index];
                      bool isHovered = false;
                      return StatefulBuilder(builder: (context, setState) {
                        return MouseRegion(
                          onEnter: (_) => setState(() => isHovered = true),
                          onExit: (_) => setState(() => isHovered = false),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedContainer(
                                duration: 1.seconds,
                                curve: Curves.fastOutSlowIn,
                                height: isHovered ? 120 : 100,
                                margin: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  data.imageString,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Text(data.skillName,
                                  style: context.theme.textTheme.titleMedium),
                            ],
                          ),
                        );
                      });
                    })),
              ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/models/social_media.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconsWidget extends StatefulWidget {
  const SocialMediaIconsWidget({
    required this.socialMediaLinks,
    Key? key,
  }) : super(key: key);
  final List<SocialMedia> socialMediaLinks;

  @override
  State<SocialMediaIconsWidget> createState() => _SocialMediaIconsWidgetState();
}

class _SocialMediaIconsWidgetState extends State<SocialMediaIconsWidget>
    with TickerProviderStateMixin {
  late final Map<String, AnimationController> _controllerMap;

  late final Map<String, dynamic> data;

  @override
  void initState() {
    super.initState();

    _controllerMap = Map.fromEntries(widget.socialMediaLinks.map((e) =>
        MapEntry(
            e.name.toString(),
            AnimationController(
                vsync: this,
                duration: 200.milliseconds,
                reverseDuration: 1.seconds // Duration of the spinning animation
                ))));
  }

  @override
  void dispose() {
    _controllerMap.forEach((key, value) {
      value.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: widget.socialMediaLinks.map(
        (e) {
          Color? backgroundColor;
          bool isHovered = false;
          final Uri url = Uri.parse(e.link);
          return StatefulBuilder(builder: (context, setState) {
            final controller = _controllerMap[e.name.toString()]!;

            return MouseRegion(
              onEnter: (_) {
                setState(() => isHovered = true);
                _controllerMap[e.name.toString()]!.forward();
              },
              onExit: (_) {
                setState(() => isHovered = false);
                _controllerMap[e.name.toString()]!.reset();
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    // backgroundColor: backgroundColor?.withOpacity(0.5),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () async {
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  icon: Tooltip(
                    margin: const EdgeInsets.only(top: 10),
                    waitDuration: 500.milliseconds,
                    message: e.toolTip,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          bottom: 0,
                          left: 0,
                          child: AnimatedContainer(
                            width: isHovered ? context.width : 0,
                            curve: Curves.fastOutSlowIn,
                            duration: 200.milliseconds,
                            color: e.color,
                          ),
                        ),
                        RotationTransition(
                          turns: controller,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: FaIcon(
                              e.name,
                              size: isHovered ? 30 : null,
                              color: isHovered ? Colors.white : null,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          });
        },
      ).toList(),
    );
  }
}

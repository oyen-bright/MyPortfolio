import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/models/social_media.dart';
import 'package:my_portfolio/widgets/buttons/animated_icon_button.dart';
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
                duration: Constants.kIconButtonAnimationDuration,
                reverseDuration: Constants
                    .kIconButtonReverseAnimationDuration // Duration of the spinning animation
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
      children: widget.socialMediaLinks
          .map((e) => AnimatedIconWidget(
              iconData: e.name,
              toolTipMessage: e.toolTip,
              onPressed: () async {
                final Uri url = Uri.parse(e.link);

                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
              controller: _controllerMap[e.name.toString()]!,
              backgroundColor: e.color,
              backgroundAnimationDuration:
                  Constants.kIconButtonAnimationDuration))
          .toList(),
    );
  }
}

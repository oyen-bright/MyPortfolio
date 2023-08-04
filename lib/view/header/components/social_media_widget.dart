import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaIconsWidget extends StatelessWidget {
  const SocialMediaIconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: Data.socialMediaLinks.map(
        (e) {
          Color? backgroundColor;
          final Uri url = Uri.parse(e.link);
          return StatefulBuilder(builder: (context, setState) {
            return MouseRegion(
              onEnter: (_) => setState(() => backgroundColor = e.color),
              onExit: (_) => setState(() => backgroundColor = null),
              child: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: backgroundColor?.withOpacity(0.5),
                    shape: const RoundedRectangleBorder(),
                  ),
                  onPressed: () async {
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                  },
                  icon: FaIcon(
                    e.name,
                    color: Theme.of(context).primaryColor,
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

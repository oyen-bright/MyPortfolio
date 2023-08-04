import 'package:flutter/material.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/util.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class DownloadResume extends StatelessWidget {
  const DownloadResume(
      {Key? key, this.centered = false, this.showCallButton = false})
      : super(key: key);

  final bool centered;
  final bool showCallButton;

  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(horizontal: 8.0, vertical: 15);
    return Row(
      mainAxisAlignment:
          centered ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        ElevatedButton(
            onPressed: () => Util.lunchUrl(Data.personalLink['sportify_link']),
            child: const Padding(
              padding: padding,
              child: Text("My Résumé"),
            )),
        10.width,
        ElevatedButton(
            onPressed: () =>
                Util.lunchUrl("mailto:${Data.personalLink['email']}"),
            child: const Padding(
              padding: padding,
              child: Text("My Email"),
            )),
      ],
    );
  }
}

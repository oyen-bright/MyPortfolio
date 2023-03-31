import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class ContactInformation extends StatelessWidget {
  const ContactInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(100),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FittedBox(
                    child: ContactInfo(
                  heading: "Email:",
                  info: "oyeniyibrighta@gmail.com",
                )),
                const SizedBox(
                  height: 15,
                ),
                const FittedBox(
                    child: ContactInfo(
                  heading: "Mobile Number:",
                  info: "+2348083763447",
                )),
                35.height,
                Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: const SocialMediaIconsWidget()),
                10.height,
                const DownloadResume(
                  showCallButton: true,
                  centered: true,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ContactInfo extends StatelessWidget {
  final String heading;
  final String info;
  const ContactInfo({super.key, required this.heading, required this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(heading, style: Theme.of(context).textTheme.headlineMedium),
        SelectableText(
          info,
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

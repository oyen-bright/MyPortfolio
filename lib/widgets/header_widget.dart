import 'dart:html';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height / 1.5,
      decoration: BoxDecoration(
          color: context.theme.colorScheme.onSecondary,
          image: const DecorationImage(
              fit: BoxFit.fitWidth,
              opacity: 0.8,
              image: AssetImage(
                  "assets/background/PikPng.com_png-images-for-website_5782721.png"))),
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Container(
              // decoration: const BoxDecoration(
              //     image: DecorationImage(
              //         fit: BoxFit.fitWidth,
              //         opacity: 0.8,
              //         image: AssetImage(
              //             "assets/background/PikPng.com_png-images-for-website_5782721.png"))),
              child: Padding(
                padding: EdgeInsets.only(
                  left: context.width / 18,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"I Am:',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    const TypeWriterTextWidget(
                      fontSize: 75,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SocialMediaIconsWidget(),
                    10.height,
                    const DownloadResume()
                  ],
                ),
              ),
            )),
        Container(
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width / 18 * 2, left: 10),
            // width: 200,
            // height: 300,
            child: Center(
              child: Image.asset(
                "assets/ppp2.png",
                scale: 9,
                fit: BoxFit.contain,
              ),
            )),
      ]),
    );
  }
}

class TypeWriterTextWidget extends StatelessWidget {
  final double fontSize;

  const TypeWriterTextWidget({Key? key, required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: DefaultTextStyle(
        style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(fontSize: fontSize) ??
            const TextStyle(),
        child: FittedBox(
          child: AnimatedTextKit(
            totalRepeatCount: 100,
            animatedTexts: [
              TypewriterAnimatedText(
                'Oyeniyi Bright"',
                speed: const Duration(milliseconds: 200),
              ),
              TypewriterAnimatedText(
                'A Mobile Developer"',
                speed: const Duration(milliseconds: 200),
              ),
              TypewriterAnimatedText(
                'A Back-End Developer"',
                speed: const Duration(milliseconds: 200),
              ),
            ],
            onTap: () {
              // print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}

class SocialMediaIconsWidget extends StatelessWidget {
  const SocialMediaIconsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: socialMediaLinks.map(
        (e) {
          final Uri url = Uri.parse(e.link);
          return Tooltip(
            message: e.toolTip,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
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
        },
      ).toList(),
    );
  }
}

class DownloadResume extends StatelessWidget {
  const DownloadResume({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnchorElement anchorElement() {
      return AnchorElement();
    }

    void downloadPdfFromAssets() async {
      // Get the PDF file from the assets folder
      var pdfData = await rootBundle.load('assets/Resume-Bright-Oyeniyi.pdf');

      // Create a new anchor element
      var anchor = anchorElement();

      // Create a Blob object from the PDF data
      var blob = Blob([pdfData], 'application/pdf');

      // Set the anchor's href to the Blob object URL
      anchor.href = Url.createObjectUrl(blob);

      // Set the anchor's download attribute to a file name
      anchor.download = 'Bright Oyeniyi Resume.pdf';

      // Click the anchor to initiate the download
      anchor.click();
    }

    void _launchMailClient() async {
      try {
        await launchUrl(Uri.parse("mailto:oyeniyibright@gmail.com"));
      } catch (e) {
        // await Clipboard.setData(ClipboardData(text: '$kEmail'));
        // _emailCopiedToClipboard = true;
      }
    }

    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              downloadPdfFromAssets();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: Text("Download My Resume"),
            )),
        10.width,
        ElevatedButton(
            onPressed: () {
              _launchMailClient();
            },
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
              child: Text("Send Me an Email"),
            )),
      ],
    );
  }
}

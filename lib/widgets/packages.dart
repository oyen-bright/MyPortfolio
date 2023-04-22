import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:url_launcher/url_launcher.dart';

class Packages extends StatelessWidget {
  const Packages({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: context.width / 18),
              width: double.infinity,
              child: Text("Packages",
                  style: context.theme.textTheme.displaySmall)),
          15.height,
          Flexible(
              child: Center(
            child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: packages.map((e) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Expanded(
                          // flex: 4,
                          child: Container(
                              alignment: Alignment.center,
                              child: const FadeInImage(
                                  placeholder: AssetImage(
                                      "assets/logos/packages-icon-20694.png"),
                                  image: AssetImage(
                                    "assets/logos/pub-dev-logo-2x.png",
                                  ))),
                        ),
                        const Flexible(
                          flex: 2,
                          child: Text("sdffd"),
                          // child: Padding(
                          //   padding: const EdgeInsets.symmetric(horizontal: 15),
                          //   child: Column(children: [
                          //     SizedBox(
                          //         width: double.infinity,
                          //         child: Text(
                          //           e.title,
                          //           style: context.theme.textTheme.titleMedium!
                          //               .copyWith(fontWeight: FontWeight.bold),
                          //         )),
                          //     10.height,
                          //     Flexible(
                          //       child: SizedBox(
                          //           width: double.infinity,
                          //           child: AutoSizeText(e.body,
                          //               overflow: TextOverflow.ellipsis,
                          //               maxLines: 2,
                          //               minFontSize: context.theme.textTheme
                          //                   .bodyMedium!.fontSize!,
                          //               style: context
                          //                   .theme.textTheme.bodyMedium)),
                          //     ),
                          //   ]),
                          // ),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              TextButton(
                                  child: const Text('More Info'),
                                  onPressed: () async {
                                    final url = Uri.parse(e.url);
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList()),
          ))
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
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
    print(context.width);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: context.width / 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: double.infinity,
              child: Text("Packages",
                  style: context.theme.textTheme.displaySmall)),
          15.height,
          Container(
            alignment: Alignment.center,
            child: GridView.builder(
                shrinkWrap: true,
                itemCount: packages.length,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.width < 1062 ? 3 : 4,
                    childAspectRatio: 1.3),
                itemBuilder: (_, index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Container(
                              alignment: Alignment.center,
                              child: const FadeInImage(
                                  placeholder: AssetImage(
                                      "assets/logos/packages-icon-20694.png"),
                                  image: AssetImage(
                                    "assets/logos/pub-dev-logo-2x.png",
                                  ))),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Column(children: [
                              SizedBox(
                                  width: double.infinity,
                                  child: Text(
                                    packages[index].title,
                                    style: context.theme.textTheme.titleMedium!
                                        .copyWith(fontWeight: FontWeight.bold),
                                  )),
                              10.height,
                              Expanded(
                                child: SizedBox(
                                    width: double.infinity,
                                    child: AutoSizeText(packages[index].body,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        minFontSize: context.theme.textTheme
                                            .bodyMedium!.fontSize!,
                                        style: context
                                            .theme.textTheme.bodyMedium)),
                              ),
                            ]),
                          ),
                        ),
                        ButtonTheme(
                          child: ButtonBar(
                            children: <Widget>[
                              TextButton(
                                  child: const Text('More Info'),
                                  onPressed: () async {
                                    final url = Uri.parse(packages[index].url);
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
                }),
          )
        ],
      ),
    );
  }
}

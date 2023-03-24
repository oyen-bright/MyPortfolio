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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, childAspectRatio: 1.4),
                itemBuilder: (_, index) {
                  return Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              child: const FadeInImage(
                                  placeholder: AssetImage(
                                      "assets/logos/packages-icon-20694.png"),
                                  image: AssetImage(
                                    "assets/logos/pub-dev-logo-2x.png",
                                  ))),
                        ),
                        Text(packages[index].title),
                        Text(packages[index].body),
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

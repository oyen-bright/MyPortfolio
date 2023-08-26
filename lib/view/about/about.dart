import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return ViewWrapper(
      items: [
        HeaderWrapper(
            web: Row(
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AutoSizeText(
                    "I specialize in building high quality mobile & web applications.",
                    style: context.theme.textTheme.headlineLarge!
                        .copyWith(fontWeight: FontWeight.normal),
                  ),
                  40.height,
                  AutoSizeText(
                    "I also have a strong passion for opensource work.",
                    style: context.theme.textTheme.headlineLarge,
                  )
                ],
              ),
            )),
            Expanded(child: Container())
          ],
        )),
        const Footer()
      ],
    );
  }
}

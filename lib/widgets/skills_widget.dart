import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.onSecondary,
      padding: EdgeInsets.symmetric(horizontal: context.width / 18),
      height: context.height / 1.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          SizedBox(
              width: double.infinity,
              child: Text("Packages",
                  style: context.theme.textTheme.displaySmall)),
          15.height,
          Flexible(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: skills
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              e.imageString,
                              fit: BoxFit.cover,
                              height: 100,
                            ),
                          ),
                          Text(e.skillName,
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ))
                  .toList(),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

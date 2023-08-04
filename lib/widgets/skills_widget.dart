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
      height: 600,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Container(
              padding: EdgeInsets.symmetric(horizontal: context.width / 18),
              width: double.infinity,
              child:
                  Text("Skills", style: context.theme.textTheme.displaySmall)),
          15.height,
          Flexible(
            child: Center(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: Data.skills
                  .map((e) => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 100,
                            margin: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              e.imageString,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(e.skillName,
                              style: Theme.of(context).textTheme.titleLarge),
                        ],
                      ))
                  .toList(),
            )),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

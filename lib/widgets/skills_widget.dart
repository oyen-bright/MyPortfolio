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
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: context.width / 18),
      height: context.height / 1.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(flex: 1, child: Container()),
          SizedBox(
              width: double.infinity,
              child: Text("Packages",
                  style: context.theme.textTheme.displaySmall)),
          15.height,
          Flexible(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: skills
                  .map((e) => Column(
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
          )
        ],
      ),
    );
  }
}

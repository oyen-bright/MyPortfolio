// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/view/experince/components/timeline.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/header_wrapper.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Experiences extends StatefulWidget {
  const Experiences({super.key});

  @override
  State<Experiences> createState() => _ExperiencesState();
}

class _ExperiencesState extends State<Experiences> {
  late final ItemPositionsListener itemPositionsListener;

  @override
  void initState() {
    super.initState();
    itemPositionsListener = ItemPositionsListener.create();
  }

  @override
  Widget build(BuildContext context) {
    return ViewWrapper(itemPositionsListener: itemPositionsListener, items: [
      SizedBox(
        width: double.infinity,
        child: HeaderWrapper(
          web: Container(),
        ),
      ),
      SizedBox(
        height: context.height,
        width: double.infinity,
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginDesktop),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SectionHeader(
                  subtitle: "My work experiences",
                  title: "Where I've worked",
                  titleBarBackgroundColor: context.theme.primaryColor,
                  subtitleBarBackgroundColor:
                      context.theme.colorScheme.secondary,
                ),
                60.width,
                ExperienceTimeline(itemPositionsListener: itemPositionsListener)
              ],
            ),
          ),
        ),
      ),
    ]);
  }
}

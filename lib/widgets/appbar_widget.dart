import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/theme_cubit.dart';
import 'package:random_text_reveal/random_text_reveal.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants.dart';
import '../methods/emoji_generator.dart';

AppBar customAppBar(BuildContext context,
    {required ScrollController scrollController}) {
  final deviceType = getDeviceType(MediaQuery.of(context).size);
  const List<String> sectionTitles = [
    "Home",
    'Projects',
    'Packages',
    'Skills',
    "About",
    "Contact"
  ];

  if (deviceType == DeviceScreenType.mobile) {
    return AppBar(
      title: const Text("eee"),
    );
  }
  if (deviceType == DeviceScreenType.tablet) {
    return AppBar(
      title: const Text("tab"),
    );
  }

  return AppBar(
      elevation: 0,
      centerTitle: false,
      actions: [
        for (final sectionTitle in sectionTitles)
          Builder(builder: (_) {
            int onHoverSize = 0;
            final fontSize = context.theme.textTheme.bodyMedium!.fontSize;

            return StatefulBuilder(builder: (context, setState) {
              return MouseRegion(
                onHover: (_) => setState(() => onHoverSize = 3),
                onExit: (_) => setState(() => onHoverSize = 0),
                child: TextButton(
                  onPressed: () {
                    // Scroll to the corresponding section
                    // scrollController.animateTo(
                    //   sectionOffsets[sectionTitle]!,
                    //   duration: const Duration(milliseconds: 500),
                    //   curve: Curves.easeInOut,
                    // );
                  },
                  child: AnimatedDefaultTextStyle(
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeIn,
                    style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontSize: fontSize! + onHoverSize,
                        fontWeight: onHoverSize == 0
                            ? FontWeight.normal
                            : FontWeight.bold),
                    child: Text(
                      sectionTitle,
                    ),
                  ),
                ),
              );
            });
          }),
        IconButton(
            onPressed: () async {
              if (await canLaunchUrl(sportifyPlaylist)) {
                await launchUrl(sportifyPlaylist);
              }
            },
            icon: const FaIcon(FontAwesomeIcons.spotify)),
        10.width,
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Tooltip(
                message: "Click to change theme",
                child: DayNightSwitcher(
                  moonColor: context.theme.appBarTheme.backgroundColor,
                  sunColor: context.theme.appBarTheme.backgroundColor,
                  dayBackgroundColor: context.theme.scaffoldBackgroundColor,
                  isDarkModeEnabled:
                      state.currentTheme == CurrentTheme.darkTheme,
                  onStateChanged: (_) {
                    context.read<ThemeCubit>().switchTheme();
                  },
                ),
              ),
            );
          },
        ),
        (context.width / 18).width
      ],
      title: Builder(builder: (_) {
        bool isFinished = true;
        return StatefulBuilder(builder: (_, setState) {
          return GestureDetector(
            onTap: () => setState(() => isFinished = false),
            child: Padding(
                padding: EdgeInsets.only(left: context.width / 18),
                child: Builder(builder: (_) {
                  if (isFinished) {
                    return SizedBox(
                        width: double.infinity,
                        child: Row(
                          children: [
                            const Text("Bright's  "),
                            AnimatedTextKit(
                              totalRepeatCount: 1,
                              onFinished: () =>
                                  setState(() => isFinished = false),
                              animatedTexts: [
                                FadeAnimatedText('Portefeuille ${emoji()}'),
                                FadeAnimatedText('文件夹 ${emoji()}'),
                                FadeAnimatedText('портфолио ${emoji()}'),
                                FadeAnimatedText('ポートフォリオ ${emoji()}'),
                              ],
                            ),
                          ],
                        ));
                  }
                  return const RandomTextReveal(
                    text: "Bright's Portfolio ✌️",
                    duration: Duration(milliseconds: 1500),
                  );
                })),
          );
        });
      }));
}

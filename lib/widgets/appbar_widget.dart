import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:backdrop/backdrop.dart';
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

const List<Map<String, dynamic>> sectionTitles = [
  {"Title": "Home", "Icon": FontAwesomeIcons.houseChimney},
  {"Title": "Projects", "Icon": FontAwesomeIcons.boxOpen},
  {"Title": "Packages", "Icon": FontAwesomeIcons.lightbulb},
  {"Title": "Skills", "Icon": FontAwesomeIcons.laptopCode},
  {"Title": "About", "Icon": FontAwesomeIcons.info},
  {"Title": "Contact", "Icon": FontAwesomeIcons.message}
];

AppBar customAppBar(BuildContext context,
    {required ScrollController scrollController}) {
  final deviceType = getDeviceType(MediaQuery.of(context).size);

  if (deviceType == DeviceScreenType.mobile) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const AppbarTitle(),
    );
  }
  if (deviceType == DeviceScreenType.tablet) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const AppbarTitle(),
    );
  }

  return AppBar(
      elevation: 0,
      centerTitle: false,
      actions: [
        for (final sectionTitle in sectionTitles)
          Builder(builder: (_) {
            return AppbarMenue(sectionTitle: sectionTitle);
          }),
        const SportiyButton(),
        10.width,
        const ChangeTheme(),
        (context.width / 18).width
      ],
      title: const AppbarTitle());
}

class SportiyButton extends StatelessWidget {
  const SportiyButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: "My Sportiy Playlist",
      child: IconButton(
          onPressed: () async {
            if (await canLaunchUrl(sportifyPlaylist)) {
              await launchUrl(sportifyPlaylist);
            }
          },
          icon: const FaIcon(FontAwesomeIcons.spotify)),
    );
  }
}

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(
            message: "Click to change theme",
            child: DayNightSwitcher(
              moonColor: context.theme.appBarTheme.backgroundColor,
              sunColor: context.theme.appBarTheme.backgroundColor,
              dayBackgroundColor: context.theme.scaffoldBackgroundColor,
              isDarkModeEnabled: state.currentTheme == CurrentTheme.darkTheme,
              onStateChanged: (_) {
                context.read<ThemeCubit>().switchTheme();
              },
            ),
          ),
        );
      },
    );
  }
}

class AppbarTitle extends StatelessWidget {
  const AppbarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      bool isFinished = true;
      return StatefulBuilder(builder: (_, setState) {
        return GestureDetector(
          onTap: () => setState(() => isFinished = false),
          child: Padding(
              padding: EdgeInsets.only(left: context.width / 51),
              child: Container(
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Backdrop.of(context).fling();
                        },
                        icon: const FaIcon(FontAwesomeIcons.listCheck)),
                    Expanded(
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
                                      FadeAnimatedText(
                                          'Portefeuille ${emoji()}'),
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
                      }),
                    ),
                  ],
                ),
              )),
        );
      });
    });
  }
}

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage("assets/background/PngItem_169637.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              child: Text('Menu',
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            )),
        for (final sectionTitle in sectionTitles)
          CustomeListTile(
            sectionTitle: sectionTitle,
          ),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.only(bottom: 5),
                child: SportiyButton(),
              ),
              Spacer(),
              ChangeTheme()
            ],
          ),
        ))
      ]),
    );
  }
}

class CustomeListTile extends StatefulWidget {
  const CustomeListTile({super.key, required this.sectionTitle});
  final Map sectionTitle;

  @override
  State<CustomeListTile> createState() => _CustomeListTileState();
}

class _CustomeListTileState extends State<CustomeListTile> {
  int onHoverSize = 0;

  @override
  Widget build(BuildContext context) {
    final fontSize = context.theme.textTheme.titleSmall!.fontSize;

    return MouseRegion(
      onHover: (_) => setState(() => onHoverSize = 3),
      onExit: (_) => setState(() => onHoverSize = 0),
      child: ListTile(
        iconColor: context.theme.iconTheme.color,
        title: Text(
          widget.sectionTitle["Title"],
          style: context.theme.textTheme.titleSmall!
              .copyWith(fontSize: fontSize! + onHoverSize),
        ),
        onTap: () {
          // Scroll to the corresponding section
          // scrollController.animateTo(
          //   _sectionOffsets[sectionTitle]!,
          //   duration: const Duration(milliseconds: 500),
          //   curve: Curves.easeInOut,
          // );
          // Close the drawer
          Navigator.pop(context);
        },
        leading: SizedBox(
          width: 20,
          height: 20,
          child: Align(
              alignment: Alignment.center,
              child: FaIcon(widget.sectionTitle["Icon"])),
        ),
      ),
    );
  }
}

class AppbarMenue extends StatelessWidget {
  const AppbarMenue({required this.sectionTitle, super.key});
  final Map sectionTitle;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      breakpoints:
          const ScreenBreakpoints(desktop: 1000, tablet: 900, watch: 200),
      mobile: (BuildContext context) =>
          ButtonMenuIcon(titleInfor: sectionTitle),
      tablet: (BuildContext context) =>
          ButtonMenuIcon(titleInfor: sectionTitle),
      desktop: (BuildContext context) =>
          ButtonMenuText(titleInfor: sectionTitle),
    );
  }
}

class ButtonMenuIcon extends StatefulWidget {
  const ButtonMenuIcon({super.key, required this.titleInfor});
  final Map titleInfor;

  @override
  State<ButtonMenuIcon> createState() => _ButtonMenuIconState();
}

class _ButtonMenuIconState extends State<ButtonMenuIcon> {
  bool showbutton = true;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        onHover: (_) => setState(() => showbutton = false),
        onExit: (_) => setState(() => showbutton = true),
        child: Builder(builder: (_) {
          if (!showbutton) {
            return ButtonMenuText(
              titleInfor: widget.titleInfor,
            );
          }

          return IconButton(
              onPressed: () async {
                if (await canLaunchUrl(sportifyPlaylist)) {
                  await launchUrl(sportifyPlaylist);
                }
              },
              icon: FaIcon(widget.titleInfor["Icon"]));
        }));
  }
}

class ButtonMenuText extends StatefulWidget {
  const ButtonMenuText({super.key, required this.titleInfor});
  final Map titleInfor;

  @override
  State<ButtonMenuText> createState() => _ButtonMenuTextState();
}

class _ButtonMenuTextState extends State<ButtonMenuText> {
  int onHoverSize = 0;

  @override
  Widget build(BuildContext context) {
    final fontSize = context.theme.textTheme.bodyMedium!.fontSize;

    return MouseRegion(
      onHover: (_) => setState(() => onHoverSize = 3),
      onExit: (_) => setState(() => onHoverSize = 0),
      child: TextButton(
        onPressed: () {},
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          style: context.theme.textTheme.bodyMedium!.copyWith(
              fontSize: fontSize! + onHoverSize,
              fontWeight:
                  onHoverSize == 0 ? FontWeight.normal : FontWeight.bold),
          child: Text(
            widget.titleInfor["Title"],
          ),
        ),
      ),
    );
  }
}

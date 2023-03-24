// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/project_section_scroll_cubit.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:my_portfolio/widgets/animation.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final ScrollController scrollController = ScrollController();
  bool canScroll = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.offset ==
          scrollController.position.maxScrollExtent) {
        Timer(const Duration(milliseconds: 800), () {
          animate();
          context.read<ProjectSectionScrollCubit>().changeMainScreenSroll(true);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bigStyle = GoogleFonts.roboto(
        textStyle: context.theme.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold));
    return SizedBox(
      // color: context.theme.colorScheme.background,

      child: Column(children: [
        Container(
          height: 1150,
          padding: EdgeInsets.symmetric(horizontal: context.width / 18),
          width: double.infinity,
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  LocationListItem(
                      imageUrl:
                          "https://i0.wp.com/www.kroonapp.com/wp-content/uploads/2022/11/KROON-NEW-IMAGE-WEBSITE-3.png?w=721&ssl=1",
                      // imageUrl:
                      //     "https://i0.wp.com/www.kroonapp.com/wp-content/uploads/2022/11/KROON-NEW-IMAGE-WEBSITE-1.png?w=892&ssl=1",
                      name: "Kroon Kiosk",
                      country: "Be more than just a small business"),
                  45.height,
                  const BigProjectInfo(
                    playStore:
                        "https://play.google.com/store/apps/details?id=com.kroon.kiosk&hl=en&gl=US",
                    appStore: "https://apps.apple.com/app/id1625893105",
                    icon: "assets/logos/Kroon-Kiosk-logo.webp",
                    iconScale: 10,
                    title: "The small business partner",
                    body:
                        '''Kroon Kiosk is a mobile application that is available to all merchants without the need of special devices, merchant banking accounts or minimum transaction thresholds. Merchants can track their sales, inventory, employees and generate real-time reports inclusive of a business plan report.
        
For the first time informal traders and SMEs can generate credible business reports that can be used to apply for microfinancing or government assistance without the need of special training, directly from their mobile phones.''',
                  ),
                ],
              )),
              20.width,
              Expanded(
                  child: Column(
                children: [
                  LocationListItem(
                      imageUrl:
                          "https://i0.wp.com/www.kroonapp.com/wp-content/uploads/2022/11/KROON-NEW-IMAGE-WEBSITE-2.png?w=1083&ssl=1",
                      name: "Kroon",
                      country: "Kroon App is more than just a payments app."),
                  45.height,
                  const BigProjectInfo(
                    playStore:
                        "https://play.google.com/store/apps/details?id=com.kroon.kiosk&hl=en&gl=US",
                    appStore: "https://apps.apple.com/app/id1625893105",
                    icon: "assets/logos/Kroon-App-Web-@1x.webp",
                    iconScale: 6,
                    title: "Kroon App is more than just a payments app...",
                    body:
                        '''Kroon App is the link between the merchant and the greater community. With low transaction fees the Kroon platform is designed and developed to be affordable and to assist the community in becoming more digital with how they use their money.
        
With the Kroon App, you never have to worry about not having a bank account.
Get a safe and secure mobile wallet linked to your Kroon account.
Pay your bills or friends and family, instantly and safely.
Want to shop online ?... Get your own virtual card in your local currency or USD.
        ''',
                  ),
                ],
              )),
            ],
          ),
        ),
        50.height,
        MouseRegion(
          onHover: (_) {
            final mainController = widget.scrollController;

            mainController.animateTo(1295,
                curve: Curves.ease,
                duration: const Duration(milliseconds: 500));
            context
                .read<ProjectSectionScrollCubit>()
                .changeMainScreenSroll(false);
          },
          onExit: (_) {
            animate();
            context
                .read<ProjectSectionScrollCubit>()
                .changeMainScreenSroll(true);
          },
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.8,
            child: BlocBuilder<ProjectSectionScrollCubit,
                ProjectSectionScrollState>(
              builder: (context, state) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: state.projectSectionCanScroll
                      ? null
                      : const NeverScrollableScrollPhysics(),
                  controller: scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final Uri url = Uri.parse(projects[index].gitlink);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Flexible(
                            child: GestureDetector(
                              onTap: () async {
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                }
                              },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  projects[index].imageString,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            width: 280,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // SizedBox(
                                //   width: double.infinity,
                                //   child: SelectableText(
                                //     projects[index].projectName,
                                //     maxLines: 1,
                                //     style: Theme.of(context)
                                //         .textTheme
                                //         .headlineMedium,
                                //   ),
                                // ),
                                IconButton(
                                  onPressed: () async {
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    }
                                  },
                                  icon: const FaIcon(
                                    FontAwesomeIcons.link,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> animate() {
    return scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}

class BigProjectInfo extends StatelessWidget {
  const BigProjectInfo({
    Key? key,
    required this.icon,
    required this.iconScale,
    required this.title,
    required this.body,
    required this.playStore,
    required this.appStore,
  }) : super(key: key);
  final String icon;
  final double iconScale;
  final String title;
  final String body;
  final String playStore;
  final String appStore;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width / 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              icon,
              scale: iconScale,
            ),
            35.height,
            AutoSizeText(
              title,
              style: context.theme.textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            10.height,
            SizedBox(
              width: double.infinity,
              child: AutoSizeText(body,
                  minFontSize: context.theme.textTheme.bodyLarge!.fontSize!,
                  style: context.theme.textTheme.bodyLarge!),
            ),
            25.height,
            Wrap(
              children: [
                IconButton(
                  icon: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/logos/app-store.webp")),
                  onPressed: () {
                    launchUrl(Uri.parse(appStore));
                  },
                ),
                10.width,
                IconButton(
                  icon: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset("assets/logos/play-store.webp")),
                  onPressed: () {
                    launchUrl(Uri.parse(playStore));
                  },
                ),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/project_section_scroll_cubit.dart';
import 'package:my_portfolio/data/data.dart';
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
        context.read<ProjectSectionScrollCubit>().changeMainScreenSroll(true);
        Timer(const Duration(milliseconds: 800), () {
          animate();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.colorScheme.background,
      // height: MediaQuery.of(context).size.height / 1.5,
      child: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text("Projects",
                style: Theme.of(context).textTheme.displaySmall),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 1.45,
            padding: EdgeInsets.symmetric(horizontal: context.width / 18),
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                    child: Container(
                  color: context.theme.colorScheme.onSecondary,
                )),
                10.width,
                Expanded(
                    child: Container(
                  color: context.theme.colorScheme.onSecondary,
                ))
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
      ),
    );
  }

  Future<void> animate() {
    return scrollController.animateTo(scrollController.position.minScrollExtent,
        duration: const Duration(milliseconds: 500), curve: Curves.ease);
  }
}

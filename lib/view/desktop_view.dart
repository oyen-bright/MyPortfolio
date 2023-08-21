import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/controllers/men_drop_controller.dart';
import 'package:my_portfolio/widgets/appBar/custom_appBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

import 'components/expand_more_widget.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  late final ItemScrollController itemScrollController;
  late final ScrollOffsetController scrollOffsetController;
  late final ItemPositionsListener itemPositionsListener;
  late final ScrollOffsetListener scrollOffsetListener;
  late final MenuDropController menuController;

  @override
  void initState() {
    menuController = MenuDropController();
    itemScrollController = ItemScrollController();
    scrollOffsetController = ScrollOffsetController();
    itemPositionsListener = ItemPositionsListener.create();
    scrollOffsetListener = ScrollOffsetListener.create();
    _scrollPositionListener();
    _bounceEffect();

    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    menuController.dispose();

    _focusNode.dispose();
    super.dispose();
  }

  void _bounceEffect() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      while (_showDownArrow) {
        await Future.delayed(3.seconds);
        await scrollOffsetController.animateScroll(
          offset: 30,
          duration: 200.milliseconds,
          curve: Curves.easeIn,
        );
        await scrollOffsetController.animateScroll(
          offset: -30,
          duration: 100.milliseconds,
          curve: Curves.bounceOut,
        );
      }
    });
  }

  void _scrollPositionListener() {
    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      for (var position in positions) {
        if (position.itemLeadingEdge < 0.5 && position.itemTrailingEdge > 0.5) {
          if (position.index == 1) {
            setState(() {
              _enableScroll = true;
            });
          }
        } else {}
      }
    });
  }

  late final ScrollController scrollController;
  late final FocusNode _focusNode;

  bool _showDownArrow = true;
  bool _enableScroll = false;

  // void handleKeyEvent(
  //   RawKeyEvent event,
  // ) {
  //   var offset = scrollController.offset;
  //   if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
  //     setState(() {
  //       if (kReleaseMode) {
  //         scrollController.animateTo(offset - 50,
  //             duration: const Duration(milliseconds: 100), curve: Curves.ease);
  //       } else {
  //         scrollController.animateTo(offset - 50,
  //             duration: const Duration(milliseconds: 100), curve: Curves.ease);
  //       }
  //     });
  //   } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
  //     setState(() {
  //       if (kReleaseMode) {
  //         scrollController.animateTo(offset + 50,
  //             duration: const Duration(milliseconds: 100), curve: Curves.ease);
  //       } else {
  //         scrollController.animateTo(offset + 50,
  //             duration: const Duration(milliseconds: 100), curve: Curves.ease);
  //       }

  //     });
  //   }

  @override
  Widget build(BuildContext context) {
    final items = [
      // const SizedBox(
      //   width: double.infinity,
      //   child: HeaderView(),
      // ),
      SizedBox(
        height: context.height,
        width: double.infinity,
        child: Center(
          child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: Constants.kMarginDesktop),
                        height: context.height,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const sectionheader(),
                            60.width,
                            Flexible(
                              child: Timeline(
                                children: <TimelineModel>[
                                  TimelineModel(
                                    Builder(builder: (context) {
                                      bool hovered = false;
                                      return StatefulBuilder(
                                          builder: (context, setState) {
                                        return MouseRegion(
                                          onEnter: (_) =>
                                              setState(() => hovered = true),
                                          onExit: (_) =>
                                              setState(() => hovered = false),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, left: 20),
                                            child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                children: [
                                                  AnimatedContainer(
                                                    duration: 2.seconds,
                                                    child:
                                                        AnimatedDefaultTextStyle(
                                                      duration:
                                                          500.milliseconds,
                                                      curve:
                                                          Curves.fastOutSlowIn,
                                                      style: context.theme
                                                          .textTheme.titleLarge!
                                                          .copyWith(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: context
                                                                .theme
                                                                .textTheme
                                                                .titleLarge!
                                                                .fontSize! +
                                                            (hovered ? 10 : 0),
                                                      ),
                                                      child: const Text(
                                                        "Velvet Technologies",
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    "Mobile/Front-End Engineer",
                                                    style: context.theme
                                                        .textTheme.titleMedium!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    "South Africa",
                                                    style: context.theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                                    style: context.theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                                    style: context.theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                  Text(
                                                    "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                                    style: context.theme
                                                        .textTheme.bodySmall!
                                                        .copyWith(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                  ),
                                                ]),
                                          ),
                                        );
                                      });
                                    })
                                        .animate()
                                        .slideY(curve: Curves.bounceOut),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                  TimelineModel(
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Velvet Technologies",
                                              style: context
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Mobile/Front-End Engineer",
                                              style: context
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "South Africa",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                  TimelineModel(
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Velvet Technologies",
                                              style: context
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Mobile/Front-End Engineer",
                                              style: context
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "South Africa",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                  TimelineModel(
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Velvet Technologies",
                                              style: context
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Mobile/Front-End Engineer",
                                              style: context
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "South Africa",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                  TimelineModel(
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Velvet Technologies",
                                              style: context
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Mobile/Front-End Engineer",
                                              style: context
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "South Africa",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                  TimelineModel(
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 30, left: 20),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Text(
                                              "Velvet Technologies",
                                              style: context
                                                  .theme.textTheme.titleLarge!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Mobile/Front-End Engineer",
                                              style: context
                                                  .theme.textTheme.titleMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "South Africa",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                            Text(
                                              "Collaborated with a team to deliver multi-platform applications for iOS and Android, focusing on creating captivating user interfaces and seamless user experiences for the Play Store and App Store.",
                                              style: context
                                                  .theme.textTheme.bodySmall!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ]),
                                    ),
                                    position: TimelineItemPosition.right,
                                    icon: const Icon(Icons.receipt,
                                        color: Colors.white),
                                    iconBackground: Colors.blue,
                                  ),
                                ],
                                position: TimelinePosition.Left,
                                iconSize: 40,
                                lineColor: Colors.blue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 400,
                    color: Colors.red,
                  )
                ][index];
              }),
        ),
      )
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context,
          showItem: _enableScroll, menuController: menuController),
      bottomSheet: ExpandMoreWidget(
        onTap: () {
          setState(() {
            _showDownArrow = false;
          });
          itemScrollController.scrollTo(
              index: 1,
              duration: Constants.kAnimationDuration,
              curve: Curves.easeInOutCubic);
        },
        showDownArrow: _showDownArrow,
      ),
      body: Stack(
        children: [
          GestureDetector(
            onTap: () => menuController.isOpen ? menuController.close() : null,
            child: ScrollConfiguration(
              behavior:
                  const ScrollBehavior().copyWith(scrollbars: _enableScroll),
              child: ScrollablePositionedList.builder(
                physics:
                    _enableScroll ? null : const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return items[index];
                },
                itemScrollController: itemScrollController,
                scrollOffsetController: scrollOffsetController,
                itemPositionsListener: itemPositionsListener,
                scrollOffsetListener: scrollOffsetListener,
              ),
            ),
          ),
          // ValueListenableBuilder(
          //     valueListenable: menuController,
          //     builder: (context, MenuStatus value, _) {
          //       return AnimatedContainer(
          //         curve: value ? Curves.bounceOut : Curves.easeOut,
          //         duration: Constants.kMenuDropDuration,
          //         width: double.infinity,
          //         color: Colors.green,
          //         height: value ? 300 : 0,
          //       );
          //     })
        ],
      ),
    );

    // return BackDropScaffold(
    //     appBar: customAppBar(context, scrollController: scrollController),
    //     scrollController: scrollController,
    //     backLayer: const BackDropScreen(),
    //     frontLayer: RawKeyboardListener(
    //       autofocus: true,
    //       focusNode: _focusNode,
    //       onKey: handleKeyEvent,
    //       child: Scrollbar(
    //         thickness: 8,
    //         controller: scrollController,
    //         trackVisibility: true,
    //         thumbVisibility: true,
    //         child: BlocBuilder<ProjectSectionScrollCubit,
    //             ProjectSectionScrollState>(
    //           builder: (context, state) {
    //             return ListView(
    //               controller: scrollController,
    //               physics: state.mainCanScrokk
    //                   ? const BouncingScrollPhysics()
    //                   : const NeverScrollableScrollPhysics(),
    //               shrinkWrap: true,
    //               children: [
    //                 const Header(),
    //                 50.height,
    //                 ProjectsSection(
    //                   scrollController: scrollController,
    //                 ),
    //                 100.height,
    //                 const Packages(),
    //                 120.height,
    //                 const SkillsSection(),
    //                 40.height,
    //                 const GithubStats(),
    //                 40.height,
    //                 const AboutSection(),
    //                 40.height,
    //                 const Fotter(),
    //               ],
    //             );
    //           },
    //         ),
    //       ),
    //     ));
  }
}

class sectionheader extends StatelessWidget {
  const sectionheader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 30,
                width: 5,
                color: Colors.blue,
              ),
              const Text("My work experiences")
            ],
          )
              .animate()
              .fadeIn() // uses `Animate.defaultDuration`
              .slideX(), // inherits duration from fadeIn
          // runs after the above w/new duration

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 60,
                width: 5,
                color: Colors.red,
              ),
              const Text(
                "Where I've worked",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )
            ],
          )
              .animate(delay: 1.milliseconds)
              .fadeIn() // uses `Animate.defaultDuration`
              .slideX(), //
        ],
      ),
    );
  }
}

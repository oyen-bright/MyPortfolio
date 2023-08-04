import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/controllers/men_drop_controller.dart';
import 'package:my_portfolio/view/header/header_widget.dart';
import 'package:my_portfolio/widgets/appBar/custom_appBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
      const SizedBox(
        width: double.infinity,
        child: HeaderView(),
      ),
      Container(
        height: context.height,
        width: double.infinity,
        color: Colors.green,
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
              duration: kAnimationDuration,
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
          ValueListenableBuilder(
              valueListenable: menuController,
              builder: (context, bool value, _) {
                return AnimatedContainer(
                  curve: value ? Curves.bounceOut : Curves.easeOut,
                  duration: kMenuDropDuration,
                  width: double.infinity,
                  color: Colors.green,
                  height: value ? 300 : 0,
                );
              })
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

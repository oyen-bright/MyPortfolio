import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/widgets/AppBar/custom_appBar.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

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
  @override
  void initState() {
    itemScrollController = ItemScrollController();
    scrollOffsetController = ScrollOffsetController();
    itemPositionsListener = ItemPositionsListener.create();
    scrollOffsetListener = ScrollOffsetListener.create();
    _scrollPositionListener();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
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
      SizedBox(
        height: context.height,
        width: double.infinity,
        child: const HeaderWidget(),
      ),
      Container(
        height: context.height,
        width: double.infinity,
        color: Colors.green,
      )
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context, showItem: _enableScroll),
      bottomSheet: GestureDetector(
        onTap: () {
          itemScrollController.scrollTo(
              index: 1,
              duration: kAnimationDuration,
              curve: Curves.easeInOutCubic);
          setState(() {
            _showDownArrow = false;
            itemScrollController.scrollTo(
                index: 1,
                duration: kAnimationDuration,
                curve: Curves.easeInOutCubic);
          });
        },
        child: AnimatedContainer(
          duration: kAnimationDuration,
          curve: Curves.easeInOutCubic,
          width: double.infinity,
          height: !_showDownArrow ? 0 : 80,
          color: Colors.red.withOpacity(0.001),
          child: const Icon(Icons.arrow_downward),
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(scrollbars: _enableScroll),
        child: ScrollablePositionedList.builder(
          physics: _enableScroll ? null : const NeverScrollableScrollPhysics(),
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

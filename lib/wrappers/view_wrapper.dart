import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/controllers/men_drop_controller.dart';
import 'package:my_portfolio/view/components/expand_more_widget.dart';
import 'package:my_portfolio/widgets/AppBar/custom_appBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ViewWrapper extends StatefulWidget {
  const ViewWrapper(
      {super.key, required this.items, this.itemPositionsListener});
  final List<Widget> items;
  final ItemPositionsListener? itemPositionsListener;

  @override
  State<ViewWrapper> createState() => _ViewWrapperState();
}

class _ViewWrapperState extends State<ViewWrapper> {
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
    itemPositionsListener =
        widget.itemPositionsListener ?? ItemPositionsListener.create();
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
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   while (_showDownArrow) {
    //     await Future.delayed(3.seconds);
    //     await scrollOffsetController.animateScroll(
    //       offset: 30,
    //       duration: 200.milliseconds,
    //       curve: Curves.easeIn,
    //     );
    //     await scrollOffsetController.animateScroll(
    //       offset: -30,
    //       duration: 100.milliseconds,
    //       curve: Curves.bounceOut,
    //     );
    //   }
    // });
  }

  void _scrollPositionListener() {
    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      for (var position in positions) {
        if (position.itemLeadingEdge < 0.5 && position.itemTrailingEdge > 0.5) {
          if (position.index == 1) {
            if (!_enableScroll) {
              setState(() {
                _enableScroll = true;
              });
            }
          }
        }
      }
    });
  }

  late final ScrollController scrollController;
  late final FocusNode _focusNode;

  bool _showDownArrow = true;
  bool _enableScroll = false;
  @override
  Widget build(BuildContext context) {
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
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return widget.items[index];
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
                  duration: Constants.kMenuDropDuration,
                  width: double.infinity,
                  color: Colors.green,
                  height: value ? 300 : 0,
                );
              })
        ],
      ),
    );
  }
}

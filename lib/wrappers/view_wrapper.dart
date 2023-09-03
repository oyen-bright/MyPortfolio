// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/controllers/men_drop_controller.dart';
import 'package:my_portfolio/widgets/AppBar/custom_appBar.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

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
  late final ScrollController scrollController;
  late final FocusNode _focusNode;

  @override
  void initState() {
    menuController = MenuDropController();
    itemScrollController = ItemScrollController();
    scrollOffsetController = ScrollOffsetController();
    itemPositionsListener =
        widget.itemPositionsListener ?? ItemPositionsListener.create();
    scrollOffsetListener = ScrollOffsetListener.create();
    scrollController = ScrollController();
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

  int getCurrentIndex() {
    final positions = itemPositionsListener.itemPositions.value;
    for (var position in positions) {
      if (position.itemLeadingEdge < 0.5 && position.itemTrailingEdge > 0.5) {
        return position.index;
      }
    }
    return 0; // Return -1 if no valid index is found
  }

  void _scrollPage(int index) {
    final currentPosition = itemPositionsListener.itemPositions.value
        .where((position) =>
            position.itemLeadingEdge < 0.5 && position.itemTrailingEdge > 0.5)
        .first;

    if (currentPosition.index + index >= 0 &&
        currentPosition.index + index < widget.items.length) {
      itemScrollController.scrollTo(
        index: currentPosition.index + index,
        duration: Constants.kAnimationDuration,
        curve: Curves.easeInOutCubic,
      );
    }
  }

  Offset cursorPosition = const Offset(0, 0);

  final bool _showDownArrow = true;
  bool _enableScroll = true;
  // bool _enableScroll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: customAppBar(context,
          showItem: _enableScroll, menuController: menuController),
      // bottomSheet: ExpandMoreWidget(
      //   onTap: () {
      //     setState(() {
      //       _showDownArrow = false;
      //     });
      //     itemScrollController.scrollTo(
      //         index: 1,
      //         duration: Constants.kAnimationDuration,
      //         curve: Curves.easeInOutCubic);
      //   },
      //   showDownArrow: _showDownArrow,
      // ),
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
          // Align(
          //     alignment: Alignment.centerLeft,
          //     child: HoverButton(
          //       text: "Page Up",
          //       onPressed: () => _scrollPage(-1),
          //       iconData: Icons.keyboard_arrow_up,
          //     )),
          Align(
              alignment: Alignment.centerRight,
              child: HoverButton(
                position: TextPosition.beforeIcon,
                text: "Page Down",
                onPressed: () => _scrollPage(1),
                iconData: Icons.keyboard_arrow_right,
              )),

          ValueListenableBuilder(
            valueListenable: menuController,
            builder: (BuildContext context, MenuStatus value, Widget? child) {
              if (value == MenuStatus.open || value == MenuStatus.blur) {
                return Positioned.fill(
                  child: GestureDetector(
                    onTap: () => menuController.close(),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        color: Colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                );
              }
              return Container();
            },
          ),

          ValueListenableBuilder(
              valueListenable: menuController,
              builder: (context, MenuStatus value, _) {
                return AnimatedContainer(
                  curve: value == MenuStatus.open
                      ? Curves.bounceOut
                      : Curves.easeOut,
                  duration: Constants.kMenuDropDuration,
                  width: double.infinity,
                  color: context.theme.scaffoldBackgroundColor,
                  height: value == MenuStatus.open ? 300 : 0,
                  child: OverflowBox(
                    maxHeight: 300,
                    child: Column(
                      children: [
                        kToolbarHeight.height,
                        const Text("itsahaman")
                      ],
                    ),
                  ),
                );
              }),

          // Positioned(
          //   left: cursorPosition.dx - 10,
          //   top: cursorPosition.dy - 10,
          //   child: IgnorePointer(
          //     child: Container(
          //       width: 20,
          //       height: 20,
          //       decoration: BoxDecoration(
          //         border: Border.all(),
          //         shape: BoxShape.circle,
          //         color: Colors.transparent,
          //       ),
          //     ),
          //   ),
          // ),

          SizedBox(
            width: 200,
            child: Center(
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: ModelViewer(
                  backgroundColor: Colors.transparent,
                  src:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  alt: 'A 3D model of an astronaut',
                  ar: true,
                  autoRotate: true,
                  iosSrc:
                      'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                  disableZoom: true,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  const HoverButton({
    Key? key,
    required this.iconData,
    this.size = 30,
    this.text,
    this.position = TextPosition.afterIcon, // Default position is after icon
    this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final double size;
  final String? text;
  final TextPosition position; // Position of the text
  final Function()? onPressed;

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

enum TextPosition {
  beforeIcon,
  afterIcon,
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MouseRegion(
        cursor: MaterialStateMouseCursor.clickable,
        onEnter: (_) {
          // Mouse enter handler: Change button appearance
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          // Mouse exit handler: Change button appearance back
          setState(() {
            isHovered = false;
          });
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.position == TextPosition.beforeIcon &&
                widget.text != null)
              _buildText(),
            IconButton(
              style: IconButton.styleFrom(elevation: 10),
              onPressed: widget.onPressed,
              icon: Icon(
                widget.iconData,
                color: isHovered ? Colors.black : null, // Change color
                size: isHovered ? widget.size + 10 : widget.size, // Change size
              ),
            ),
            if (widget.position == TextPosition.afterIcon &&
                widget.text != null)
              _buildText(),
          ],
        ),
      ),
    );
  }

  Widget _buildText() {
    return AnimatedOpacity(
      curve: Curves.easeIn,
      opacity: isHovered ? 1 : 0,
      duration: 200.milliseconds,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: context.theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2), // Shadow color
                blurRadius: 5, // Shadow blur radius
                offset: const Offset(0, 2), // Shadow offset
              ),
            ],
          ),
          child: Text(
            widget.text!,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

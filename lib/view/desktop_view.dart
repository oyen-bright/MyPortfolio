import 'package:backdrop/backdrop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class DesktopView extends StatefulWidget {
  const DesktopView({super.key});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
  @override
  void initState() {
    scrollController = ScrollController();
    _focusNode = FocusNode();
    scrollController.addListener(() {
      // if (scrollController.offset < -38) {
      //   Backdrop.of(context).fling();
      // }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  late final ScrollController scrollController;

  late final FocusNode _focusNode;

  void _handleKeyEvent(RawKeyEvent event) {
    var offset = scrollController.offset;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(offset - 50,
              duration: const Duration(milliseconds: 100), curve: Curves.ease);
        } else {
          scrollController.animateTo(offset - 50,
              duration: const Duration(milliseconds: 100), curve: Curves.ease);
        }
      });
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        if (kReleaseMode) {
          scrollController.animateTo(offset + 50,
              duration: const Duration(milliseconds: 100), curve: Curves.ease);
        } else {
          scrollController.animateTo(offset + 50,
              duration: const Duration(milliseconds: 100), curve: Curves.ease);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackdropScaffold(
      floatingActionButton: ScrollUpFAB(scrollController: scrollController),
      frontLayerScrim: context.theme.colorScheme.secondary.withOpacity(0.5),
      headerHeight: context.height / 2,
      frontLayerBorderRadius: BorderRadius.zero,
      backLayer: Container(
        width: context.width,
        height: context.height,
        color: context.theme.scaffoldBackgroundColor,
      ),
      appBar: customAppBar(context, scrollController: scrollController),
      frontLayer: RawKeyboardListener(
        autofocus: true,
        focusNode: _focusNode,
        onKey: _handleKeyEvent,
        child: Scrollbar(
          thickness: 8,
          controller: scrollController,
          trackVisibility: true,
          thumbVisibility: true,
          child: ListView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [const Header(), 100.height, const Fotter()],
          ),
        ),
      ),
    );
  }
}

class ScrollUpFAB extends StatefulWidget {
  const ScrollUpFAB({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  State<ScrollUpFAB> createState() => _ScrollUpFABState();
}

class _ScrollUpFABState extends State<ScrollUpFAB> {
  bool isVisible = false;

  @override
  void initState() {
    final scontroller = widget.scrollController;

    scontroller.addListener(() {
      if (scontroller.offset == scontroller.position.maxScrollExtent) {
        setState(() {
          isVisible = true;
        });
      } else {
        setState(() {
          isVisible = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              onPressed: () {
                Backdrop.of(context).fling();
              },
              icon: const FaIcon(FontAwesomeIcons.listCheck),
              label: Container(),
            ),
            15.width,
            FloatingActionButton(
              onPressed: () {
                final scontroller = widget.scrollController;
                scontroller.animateTo(scontroller.position.minScrollExtent,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceOut);
              },
              child: const FaIcon(FontAwesomeIcons.arrowUp),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:backdrop/backdrop.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/cubit/cubit/project_section_scroll_cubit.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/backdrop_scaffold.dart';
import 'package:my_portfolio/widgets/backdrop_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:my_portfolio/widgets/packages.dart';
import 'package:my_portfolio/widgets/projects_widget.dart';
import 'package:my_portfolio/widgets/skills_widget.dart';
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
      if (scrollController.offset < -0) {
        // Backdrop.of(context).fling();
      }
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

  void handleKeyEvent(
    RawKeyEvent event,
  ) {
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
    return BackDropScaffold(
        appBar: customAppBar(context, scrollController: scrollController),
        scrollController: scrollController,
        backLayer: const BackDropScreen(),
        frontLayer: RawKeyboardListener(
          autofocus: true,
          focusNode: _focusNode,
          onKey: handleKeyEvent,
          child: Scrollbar(
            thickness: 8,
            controller: scrollController,
            trackVisibility: true,
            thumbVisibility: true,
            child: BlocBuilder<ProjectSectionScrollCubit,
                ProjectSectionScrollState>(
              builder: (context, state) {
                return ListView(
                  controller: scrollController,
                  physics: state.mainCanScrokk
                      ? const BouncingScrollPhysics()
                      : const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    const Header(),
                    50.height,
                    ProjectsSection(
                      scrollController: scrollController,
                    ),
                    50.height,
                    const Packages(),
                    const SkillsSection(),
                    const Fotter(),
                  ],
                );
              },
            ),
          ),
        ));
  }
}

class ScrollUpFAB extends StatefulWidget {
  const ScrollUpFAB(
      {super.key, required this.scrollController, this.closeFAB = false});
  final ScrollController scrollController;
  final bool closeFAB;

  @override
  State<ScrollUpFAB> createState() => _ScrollUpFABState();
}

class _ScrollUpFABState extends State<ScrollUpFAB> {
  bool isVisible = false;

  @override
  void initState() {
    final scontroller = widget.scrollController;

    scontroller.addListener(() {
      if (scontroller.offset >= scontroller.position.maxScrollExtent) {
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
        child: Builder(builder: (context) {
          final close = widget.closeFAB;
          var extendedFAB = FloatingActionButton.extended(
            onPressed: () {
              Backdrop.of(context).fling();
            },
            icon: FaIcon(
                close ? FontAwesomeIcons.xmark : FontAwesomeIcons.listCheck),
            label: close ? const Text("Close") : Container(),
          );

          if (close) {
            return extendedFAB;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              extendedFAB,
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
          );
        }),
      ),
    );
  }
}

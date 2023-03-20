import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/scroll_cubit.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class BackDropScaffold extends StatelessWidget {
  const BackDropScaffold(
      {super.key,
      required this.scrollController,
      required this.backLayer,
      required this.frontLayer,
      this.appBar,
      this.endDrawer});
  final ScrollController scrollController;
  final Widget backLayer;
  final Widget frontLayer;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScrollCubit, ScrollState>(
      builder: (context, state) {
        return BackdropScaffold(
          endDrawer: endDrawer,
          floatingActionButton: ScrollUpFAB(scrollController: scrollController),
          frontLayerScrim: context.theme.colorScheme.secondary.withOpacity(0.5),
          headerHeight: (context.height / 2) - state.scrollOffset,
          frontLayerBorderRadius: BorderRadius.zero,
          maintainBackLayerState: false,
          backLayer: backLayer,
          frontLayer: frontLayer,
          appBar: appBar,
        );
      },
    );
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

import 'package:backdrop/backdrop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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
          floatingActionButton: const TestFloatingActionButton(),
          // floatingActionButton: ScrollUpFAB(scrollController: scrollController),
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

class TestFloatingActionButton extends StatelessWidget {
  const TestFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      // animatedIcon: AnimatedIcons.menu_close,
      // animatedIconTheme: IconThemeData(size: 22.0),
      // / This is ignored if animatedIcon is non null
      // child: Text("open"),
      // activeChild: Text("close"),
      icon: Icons.add,
      activeIcon: Icons.close,
      spacing: 3,
      // mini: mini,
      // openCloseDial: isDialOpen,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      dialRoot: 2 > 4
          ? (ctx, open, toggleChildren) {
              return ElevatedButton(
                onPressed: toggleChildren,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[900],
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
                ),
                child: const Text(
                  "Custom Dial Root",
                  style: TextStyle(fontSize: 17),
                ),
              );
            }
          : null,
      // buttonSize:
      //     buttonSize, // it's the SpeedDial size which defaults to 56 itself
      // iconTheme: IconThemeData(size: 22),
      label: const Text("Open"), // The label of the main button.
      /// The active label of the main button, Defaults to label if not specified.
      activeLabel: const Text("Close"),

      elevation: 8.0,
      animationCurve: Curves.elasticInOut,
      isOpenOnStart: false,
      shape: 1 < 4 ? const RoundedRectangleBorder() : const StadiumBorder(),
      // childMargin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      children: [
        SpeedDialChild(
          child: 1 < 4 ? const Icon(Icons.accessibility) : null,
          backgroundColor: Colors.red,
          foregroundColor: Colors.white,
          label: 'First',
          onTap: () => null,
          onLongPress: () => debugPrint('FIRST CHILD LONG PRESS'),
        ),
        SpeedDialChild(
          child: 1 < 4 ? const Icon(Icons.brush) : null,
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          label: 'Second',
          onTap: () => debugPrint('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: 1 < 4 ? const Icon(Icons.margin) : null,
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          label: 'Show Snackbar',
          visible: true,
          onTap: () => ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(("Third Child Pressed")))),
          onLongPress: () => debugPrint('THIRD CHILD LONG PRESS'),
        ),
      ],
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

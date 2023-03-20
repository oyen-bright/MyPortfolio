import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/backdrop_scaffold.dart';
import 'package:my_portfolio/widgets/backdrop_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class TabletView extends StatefulWidget {
  const TabletView({super.key});

  @override
  State<TabletView> createState() => _TabletViewState();
}

class _TabletViewState extends State<TabletView> {
  @override
  void initState() {
    scrollController = ScrollController();
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
    super.dispose();
  }

  late final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = ScrollController();
    return BackDropScaffold(
      scrollController: scrollcontroller,
      backLayer: const BackDropScreen(),
      appBar: customAppBar(context, scrollController: scrollcontroller),
      endDrawer: const EndDrawer(),
      frontLayer: ListView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [const Header(), 100.height, const Fotter()],
      ),
    );
  }
}

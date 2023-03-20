import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/backdrop_scaffold.dart';
import 'package:my_portfolio/widgets/backdrop_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';
import 'package:my_portfolio/widgets/header_widget.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class MobileView extends StatelessWidget {
  const MobileView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();
    return BackDropScaffold(
      scrollController: scrollController,
      backLayer: const BackDropScreen(),
      appBar: customAppBar(context, scrollController: scrollController),
      endDrawer: const EndDrawer(),
      frontLayer: ListView(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [const Header(), 100.height, const Fotter()],
      ),
    );
  }
}

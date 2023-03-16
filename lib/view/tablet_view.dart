import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';

class TabletView extends StatelessWidget {
  const TabletView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollcontroller = ScrollController();
    return Scaffold(
      appBar: customAppBar(context, scrollController: scrollcontroller),
      endDrawer: const EndDrawer(),
      body: ListView(
        shrinkWrap: true,
        children: const [Fotter()],
      ),
    );
  }
}

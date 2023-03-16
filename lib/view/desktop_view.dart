import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/appbar_widget.dart';
import 'package:my_portfolio/widgets/footer_widget.dart';

class DesktopView extends StatelessWidget {
  const DesktopView({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return Scaffold(
      appBar: customAppBar(context, scrollController: scrollController),
      body: ListView(
        shrinkWrap: true,
        children: const [Fotter()],
      ),
    );
  }
}

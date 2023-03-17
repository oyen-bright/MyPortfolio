import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/scroll_cubit.dart';
import 'package:my_portfolio/view/desktop_view.dart';

class BackDropScreen extends StatefulWidget {
  const BackDropScreen({
    super.key,
  });

  @override
  State<BackDropScreen> createState() => _BackDropScreenState();
}

class _BackDropScreenState extends State<BackDropScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      context.read<ScrollCubit>().changeScrollOffset(scrollController.offset);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ScrollUpFAB(
        scrollController: scrollController,
        closeFAB: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: context.theme.scaffoldBackgroundColor,
        child: ListView.builder(
            controller: scrollController,
            itemCount: 100,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(index.toString()),
              );
            }),
      ),
    );
  }
}

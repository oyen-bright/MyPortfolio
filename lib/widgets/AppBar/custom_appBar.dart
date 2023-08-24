import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/controllers/men_drop_controller.dart';
import 'package:my_portfolio/widgets/appBar/components/title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../../data/data.dart';
import 'components/item.dart';

enum AppBarType { liner, dropDown }

PreferredSizeWidget customAppBar(BuildContext context,
    {ScrollController? scrollController,
    required bool showItem,
    AppBarType type = AppBarType.liner,
    required MenuDropController menuController}) {
  final deviceType = getDeviceType(MediaQuery.of(context).size);

  if (deviceType == DeviceScreenType.mobile) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: ValueListenableBuilder(
          valueListenable: menuController,
          builder: (context, MenuStatus value, _) {
            return AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: false,
              actions: [
                IconButton(
                  onPressed: () => menuController.toggle(),
                  icon:
                      Icon(value == MenuStatus.open ? Icons.close : Icons.menu),
                ),
              ],
              title: value == MenuStatus.open ? null : const AppBarTitle(),
            );
          }),
    );
  }
  if (deviceType == DeviceScreenType.tablet) {
    menuController.isOpen ? menuController.close() : null;
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      title: const AppBarTitle(),
    );
  }
  menuController.isOpen ? menuController.close() : null;

  return PreferredSize(
    preferredSize: const Size.fromHeight(kToolbarHeight),
    child: MouseRegion(
      onEnter: (_) {
        menuController.blur(true);
      },
      onExit: (_) => menuController.blur(false),
      child: AppBar(
          titleSpacing: 55,
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          centerTitle: false,
          actions: !showItem
              ? []
              : [
                  for (final sectionTitle in Data.sectionTitles)
                    Container(
                        padding: const EdgeInsets.all(10),
                        color: context.theme.scaffoldBackgroundColor,
                        child: MenuItem(titleInformation: sectionTitle)),
                  55.width,
                ].animate().slideX(
                  curve: Curves.easeInOutCubic,
                  duration: Constants.kAnimationDuration),
          title: const AppBarTitle()),
    ),
  );
}

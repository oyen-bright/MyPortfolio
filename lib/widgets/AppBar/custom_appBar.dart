import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/widgets/appBar/components/title.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../../data/data.dart';
import 'components/item.dart';

AppBar customAppBar(BuildContext context,
    {ScrollController? scrollController, required bool showItem}) {
  final deviceType = getDeviceType(MediaQuery.of(context).size);

  if (deviceType == DeviceScreenType.mobile) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const AppBarTitle(),
    );
  }
  if (deviceType == DeviceScreenType.tablet) {
    return AppBar(
      elevation: 0,
      centerTitle: false,
      title: const AppBarTitle(),
    );
  }

  return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: !showItem
          ? []
          : [
              for (final sectionTitle in sectionTitles)
                MenuItem(titleInformation: sectionTitle),
              10.width,
            ].animate().slide(
              curve: Curves.easeInOutCubic, duration: kAnimationDuration),
      title: const AppBarTitle());
}

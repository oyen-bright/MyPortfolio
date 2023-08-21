import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HeaderWrapper extends StatelessWidget {
  const HeaderWrapper({
    super.key,
    this.tablet,
    this.mobile,
    required this.web,
  });

  final Widget? tablet;
  final Widget? mobile;
  final Widget web;

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      tablet: (BuildContext context) {
        return _buildBackgroudImage(
          context,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginTablet,
              ),
              child: tablet ?? web),
        );
      },
      mobile: (BuildContext context) {
        return _buildBackgroudImage(
          context,
          boxFit: BoxFit.fitHeight,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginMobile,
              ),
              child: tablet ?? web),
        );
      },
      desktop: (BuildContext context) {
        return _buildBackgroudImage(
          context,
          child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginDesktop,
              ),
              child: tablet ?? web),
        );
      },
    );
  }

  _buildBackgroudImage(BuildContext context,
      {BoxFit boxFit = BoxFit.fitWidth, required Widget child}) {
    return Container(
      height: context.height < Constants.kMinHeight
          ? Constants.kMinHeight
          : context.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: boxFit,
              alignment: Alignment.topCenter,
              opacity: 0.3,
              image: AssetImage(Data.headerData['background_image']))),
      child: child,
    );
  }
}

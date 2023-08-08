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
    return Container(
        height: context.height < Constants.kMinHeight
            ? Constants.kMinHeight
            : context.height,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                opacity: 0.3,
                image: AssetImage(Data.headerData['background_image']))),
        child: ScreenTypeLayout.builder(
          tablet: (BuildContext context) {
            return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Constants.kMarginTablet,
                ),
                child: tablet ?? web);
          },
          mobile: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginMobile,
              ),
              child: mobile ?? web,
            );
          },
          desktop: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Constants.kMarginDesktop,
              ),
              child: web,
            );
          },
        ));
  }
}

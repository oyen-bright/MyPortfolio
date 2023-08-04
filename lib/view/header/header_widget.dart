import 'package:animate_gradient/animate_gradient.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import 'components/contact_bottons_widget.dart';
import 'components/social_media_widget.dart';
import 'components/typewriter_text_widget.dart';

class HeaderView extends StatelessWidget {
  const HeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnimateGradient(
      primaryBegin: Alignment.topLeft,
      primaryEnd: Alignment.bottomLeft,
      secondaryBegin: Alignment.bottomLeft,
      secondaryEnd: Alignment.topRight,
      primaryColors: Data.headerData['background_animation_colors']
          ['primaryColors'],
      secondaryColors: Data.headerData['background_animation_colors']
          ['secondaryColors'],
      child: Container(
          height: context.height < kMinHeight ? kMinHeight : context.height,
          decoration: BoxDecoration(
              // color: context.theme.colorScheme.onSecondary,
              image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                  opacity: 0.3,
                  image: AssetImage(Data.headerData['background_image']))),
          child: ScreenTypeLayout.builder(
            tablet: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMarginTablet,
                ),
                child: Row(children: [
                  _headerBody(context,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textFontSize: 75,
                      centered: false),
                  _headerImage(),
                ]),
              );
            },
            mobile: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMarginMobile,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    60.height,
                    _headerImage(),
                    _headerBody(context,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        textFontSize: 50,
                        centered: true),
                    kExpandButtonHeight.height,
                  ],
                ),
              );
            },
            desktop: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kMarginDesktop,
                ),
                child: Row(children: [
                  _headerBody(context,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      textFontSize: 75,
                      centered: false),
                  _headerImage(),
                ]),
              );
            },
          )),
    );
  }

  Expanded _headerBody(BuildContext context,
      {required CrossAxisAlignment crossAxisAlignment,
      required bool centered,
      required double textFontSize}) {
    return Expanded(
        flex: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: crossAxisAlignment,
          children: [
            TypeWriterTextWidget(
              fontSize: textFontSize,
              centerText: centered,
            ),
            20.height,
            const SocialMediaIconsWidget(),
            20.height,
            DownloadResume(
              centered: centered,
            )
          ],
        ));
  }

  Expanded _headerImage() {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.center,
        child: FlipCard(
          flipOnTouch: true,
          front: Image.asset(
            Data.personalLink['image'],
            scale: 9,
            fit: BoxFit.contain,
          ),
          back: Image.asset(
            Data.personalLink['image'],
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

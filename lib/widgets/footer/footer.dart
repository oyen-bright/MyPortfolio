import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import '../../constants.dart';
import '../buttons/animated_button.dart';
import 'components/social_media_llinks.dart';

class Footer extends StatelessWidget {
  const Footer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    late final BoxFit boxFit;

    final deviceType = getDeviceType(MediaQuery.of(context).size);

    switch (deviceType) {
      case DeviceScreenType.mobile:
        boxFit = BoxFit.fitHeight;
        break;
      default:
        boxFit = BoxFit.fitWidth;
        break;
    }
    return RotatedBox(
      quarterTurns: 2,
      child: Container(
        height: context.height < Constants.kMinHeight
            ? (Constants.kMinHeight)
            : context.height / 1.5,
        decoration: BoxDecoration(
            // color: context.theme.colorScheme.onSecondary,
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                alignment: Alignment.topCenter,
                opacity: 0.1,
                image: AssetImage(Data.headerData['background_image']))),
        child: RotatedBox(
          quarterTurns: -2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Text(
                Data.footerData['title'],
                textAlign: TextAlign.center,
                style: context.theme.textTheme.displayMedium!.copyWith(
                  shadows: [
                    Shadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      blurRadius: 5, // Shadow blur radius
                      offset: const Offset(0, 2), // Shadow offset
                    ),
                  ],
                ),
              ),
              40.height,
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                color: context.theme.scaffoldBackgroundColor,
                child: Text(
                  Data.footerData['subtitle'],
                  textAlign: TextAlign.center,
                  style: context.theme.textTheme.bodyMedium,
                ),
              ),
              30.height,
              const AnimatedButton(
                title: 'SAY HELLO',
              ),
              30.height,
              SocialMediaIconsWidget(
                socialMediaLinks: Data.footerData['socialMediaData'],
              ),
              const Spacer(),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: context.theme.scaffoldBackgroundColor,
                  child: Text(Data.footerData['copyWriteText'])),
              40.height,
            ],
          ),
        ),
      ),
    );
  }
}

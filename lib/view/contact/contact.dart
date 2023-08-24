import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/widgets/buttons/animated_button.dart';
import 'package:my_portfolio/widgets/footer/footer.dart';
import 'package:my_portfolio/widgets/headers/section_header.dart';
import 'package:my_portfolio/wrappers/view_wrapper.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

import 'components/text_input.dart';

class ContactMe extends StatelessWidget {
  const ContactMe({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return ViewWrapper(items: [
      SizedBox(
        height: context.height,
        width: double.infinity,
        child: Form(
          key: formKey,
          child: Center(
            child: ScreenTypeLayout.builder(desktop: (context) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kMarginDesktop),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        _screenHeader(context),
                        60.width,
                        const Expanded(
                          child: FotterImputContactUsWidget(),
                        )
                      ],
                    ),
                    60.height,
                    AnimatedButton(
                      title: "Send Message",
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
      const Footer(
        slot: SizedBox(),
      )
    ]);
  }

  SectionHeader _screenHeader(BuildContext context) {
    return SectionHeader(
      subtitle: "Trying to reach me ?",
      title: "Contact",
      titleBarBackgroundColor: context.theme.primaryColor,
      subtitleBarBackgroundColor: context.theme.colorScheme.secondary,
    );
  }
}

class FotterImageWidget extends StatelessWidget {
  const FotterImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/pngwing1.png",
      scale: 7,
      height: 700,
    );
  }
}

class FotterImputContactUsWidget extends StatelessWidget {
  const FotterImputContactUsWidget(
      {super.key,
      this.nameTextController,
      this.emailTextController,
      this.messageTextController,
      this.isRow = true});

  final TextEditingController? nameTextController;
  final TextEditingController? emailTextController;
  final TextEditingController? messageTextController;
  final bool isRow;

  static bool isSending = false;

  @override
  Widget build(BuildContext context) {
    final headlineFontStyle = context.theme.textTheme.headlineLarge!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Constants.kMarginDesktop),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AutoSizeText(
                "Contact.",
                style: headlineFontStyle,
              ),
              2.height,
              AutoSizeText(
                "Get in touch.",
                style: headlineFontStyle,
              ),
              20.height,
              AutoSizeText(
                "Hey There, Got a project, job offer or consulting work for me? Feel free to contact me ASAP.",
                style: context.theme.textTheme.bodyLarge,
              ),
            ],
          ),
          30.height,
          const TextBoxInput(
            title: "Name",
            icon: FaIcon(FontAwesomeIcons.user),
          ),
          15.height,
          const TextBoxInput(
            title: "Email",
            icon: FaIcon(FontAwesomeIcons.envelope),
          ),
          15.height,
          const TextBoxInput(
            title: "Message",
            maxLength: 10,
            icon: FaIcon(FontAwesomeIcons.envelope),
          ),
          30.height,
        ],
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/widgets/contact_info_widget.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

class Fotter extends StatelessWidget {
  const Fotter({super.key});

  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final messageTextController = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return // Construct and pass in a widget builder per screen type
        Column(children: [
      ScreenTypeLayout.builder(
        // breakpoints:
        //     const ScreenBreakpoints(desktop: 1000, tablet: 900, watch: 200),
        mobile: (BuildContext context) => MobileFotter(
          emailTextController: emailTextController,
          formkey: formKey,
          messageTextController: messageTextController,
          nameTextController: nameTextController,
        ),
        tablet: (BuildContext context) => TabletFotter(
          emailTextController: emailTextController,
          formkey: formKey,
          messageTextController: messageTextController,
          nameTextController: nameTextController,
        ),
        desktop: (BuildContext context) => DesktopFotter(
          emailTextController: emailTextController,
          formkey: formKey,
          messageTextController: messageTextController,
          nameTextController: nameTextController,
        ),
        watch: (BuildContext context) => Container(color: Colors.purple),
      ),
      const CopyWrite()
    ]);
  }
}

class MobileFotter extends StatelessWidget {
  const MobileFotter(
      {super.key,
      required this.formkey,
      required this.nameTextController,
      required this.emailTextController,
      required this.messageTextController});
  final GlobalKey<FormState> formkey;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController messageTextController;

  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final messageTextController = TextEditingController();

    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.width / 18),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FotterImputContactUsWidget(
                  isRow: false,
                  formKey: formkey,
                  nameTextController: nameTextController,
                  emailTextController: emailTextController,
                  messageTextController: messageTextController),
            ),
            const FotterImageWidget(),
          ],
        ));
  }
}

class TabletFotter extends StatelessWidget {
  const TabletFotter(
      {super.key,
      required this.formkey,
      required this.nameTextController,
      required this.emailTextController,
      required this.messageTextController});
  final GlobalKey<FormState> formkey;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController messageTextController;

  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final messageTextController = TextEditingController();

    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.width / 18),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FotterImputContactUsWidget(
                  formKey: formkey,
                  nameTextController: nameTextController,
                  emailTextController: emailTextController,
                  messageTextController: messageTextController),
            ),
            const FotterImageWidget(),
          ],
        ));
  }
}

class DesktopFotter extends StatelessWidget {
  const DesktopFotter(
      {super.key,
      required this.formkey,
      required this.nameTextController,
      required this.emailTextController,
      required this.messageTextController});
  final GlobalKey<FormState> formkey;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController messageTextController;

  @override
  Widget build(BuildContext context) {
    final nameTextController = TextEditingController();
    final emailTextController = TextEditingController();
    final messageTextController = TextEditingController();

    return Container(
        margin: EdgeInsets.symmetric(horizontal: context.width / 4),
        child: Column(
          children: [
            Column(
              children: [
                FotterImputContactUsWidget(
                    formKey: formkey,
                    nameTextController: nameTextController,
                    emailTextController: emailTextController,
                    messageTextController: messageTextController),
                const ContactInformation(),
                // const Expanded(child: FotterImageWidget()
              ],
            ),
          ],
        ));
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
      required this.formKey,
      required this.nameTextController,
      required this.emailTextController,
      required this.messageTextController,
      this.isRow = true});

  final GlobalKey<FormState> formKey;
  final TextEditingController nameTextController;
  final TextEditingController emailTextController;
  final TextEditingController messageTextController;
  final bool isRow;

  @override
  Widget build(BuildContext context) {
    final bigStyle = GoogleFonts.poppins(
        textStyle: context.theme.textTheme.headlineLarge!
            .copyWith(fontWeight: FontWeight.bold));
    return Form(
      key: formKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: context.theme.colorScheme.onSecondary,
        ),
        padding: EdgeInsets.symmetric(
            horizontal: context.width / 25, vertical: context.width / 30),
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  "Contact.",
                  style: bigStyle,
                )),
            2.height,
            SizedBox(
                width: double.infinity,
                child: AutoSizeText(
                  "Get in touch.",
                  style: bigStyle,
                )),
            10.height,
            const SizedBox(
                width: double.infinity,
                child: AutoSizeText("Leave me a message.")),
            30.height,
            SizedBox(
              width: double.infinity,
              child: Builder(builder: (_) {
                if (isRow) {
                  return Row(
                    children: [
                      Expanded(
                        child: TextBoxInput(
                          validate: true,
                          title: "Name",
                          controller: nameTextController,
                          helperText: "Please input your name",
                          icon: const FaIcon(FontAwesomeIcons.user),
                        ),
                      ),
                      30.width,
                      Expanded(
                        child: TextBoxInput(
                          helperText: "Please input your email",
                          title: "Email",
                          controller: emailTextController,
                          icon: const FaIcon(FontAwesomeIcons.envelope),
                        ),
                      ),
                    ],
                  );
                }
                return Column(
                  children: [
                    TextBoxInput(
                      validate: true,
                      title: "Name",
                      controller: nameTextController,
                      helperText: "Please input your name",
                      icon: const FaIcon(FontAwesomeIcons.user),
                    ),
                    15.height,
                    TextBoxInput(
                      helperText: "Please input your email",
                      title: "Email",
                      controller: emailTextController,
                      icon: const FaIcon(FontAwesomeIcons.envelope),
                    ),
                  ],
                );
              }),
            ),
            15.height,
            TextBoxInput(
              helperText: "",
              title: "Message",
              validate: true,
              maxLenght: 10,
              controller: messageTextController,
              icon: const FaIcon(FontAwesomeIcons.envelope),
            ),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {}
                  // downloadPdfFromAssets();
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
                  child: Text("SEND MESSAGE"),
                )),
          ],
        ),
      ),
    );
  }
}

class CopyWrite extends StatelessWidget {
  const CopyWrite({super.key});

  @override
  Widget build(BuildContext context) {
    final year = DateTime.parse(DateTime.now().toString()).year;
    return Container(
        margin: const EdgeInsets.only(top: 15, bottom: 3),
        color: context.theme.colorScheme.background,
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // SizedBox(
            //   width: double.infinity,
            //   child: Center(
            //     child: SizedBox(
            //       child: TextLiquidFill(
            //         text: 'LIQUIDY',
            //         waveColor: Colors.blueAccent,
            //         boxBackgroundColor: Colors.redAccent,
            //         textStyle: const TextStyle(
            //           fontSize: 10.0,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         boxHeight: 20.0,
            //       ),
            //     ),
            //   ),
            // ),
            Center(
              child: Text(
                  "© $year Oyeniyi Bright. All Rights Reserved. Built with Flutter"),
            ),
          ],
        ));
  }
}

class TextBoxInput extends StatelessWidget {
  const TextBoxInput(
      {required this.title,
      required this.helperText,
      required this.controller,
      required this.icon,
      this.maxLenght,
      this.validate = false,
      super.key});

  final String title;
  final String helperText;
  final FaIcon icon;
  final int? maxLenght;
  final bool validate;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: AutoSizeText(
            "$title ${validate ? "*" : ""}",
            style: context.theme.textTheme.titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        5.height,
        TextFormField(
          validator: validate == true
              ? (value) {
                  if (value == null || value.isEmpty) {
                    return "required";
                  }
                  if (maxLenght != null) {
                    if (value.length < 10) {
                      return "message too short";
                    }
                  }
                  return null;
                }
              : null,
          style: context.theme.textTheme.bodyMedium,
          maxLines: maxLenght,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            prefixIcon: maxLenght == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: icon,
                  )
                : null,
            helperText: helperText,
            focusedBorder: maxLenght != null
                ? OutlineInputBorder(
                    borderSide: BorderSide(
                        color: context.theme.colorScheme.onSecondary))
                : null,
            enabledBorder: maxLenght != null
                ? OutlineInputBorder(
                    borderSide:
                        BorderSide(color: context.theme.colorScheme.secondary))
                : null,
          ),
        )
      ],
    );
  }
}

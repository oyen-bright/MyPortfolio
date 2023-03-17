import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/scroll_cubit.dart';
import 'package:my_portfolio/view/desktop_view.dart';
import 'package:sizedbox_extention/sizedbox_extention.dart';

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
    final bigStyle = GoogleFonts.roboto(
        textStyle: context.theme.textTheme.displayLarge!
            .copyWith(fontWeight: FontWeight.bold));
    return Scaffold(
      floatingActionButton: ScrollUpFAB(
        scrollController: scrollController,
        closeFAB: true,
      ),
      body: Scrollbar(
        controller: scrollController,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: context.theme.scaffoldBackgroundColor,
                  image: const DecorationImage(
                      alignment: Alignment.topRight,
                      opacity: 0.05,
                      scale: 2,
                      image: AssetImage(
                        "assets/background/pngwing.coma.png",
                      ))),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.width / 18),
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                      alignment: Alignment.topRight,
                      opacity: 0.6,
                      scale: 2,
                      image:
                          AssetImage("assets/background/pngwing.com (1).png"))),
              child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: Row(
                    children: [
                      Container(
                        height: 500,
                        width: 600,
                        margin: EdgeInsets.only(bottom: context.height / 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 600,
                              child: AutoSizeText("Currently".toUpperCase(),
                                  textAlign: TextAlign.left, style: bigStyle),
                            ),
                            SizedBox(
                              width: 600,
                              child: TextLiquidFill(
                                loadUntil: 0.8,
                                text: 'Working on'.toUpperCase(),
                                textAlign: TextAlign.left,
                                waveColor: context.theme.colorScheme.primary,
                                boxBackgroundColor:
                                    context.theme.colorScheme.brightness ==
                                            Brightness.light
                                        ? Colors.yellowAccent
                                        : Colors.yellow,
                                textStyle: bigStyle,
                                boxHeight: 100.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          controller: scrollController,
                          children: [
                            150.height,
                            50.height,
                            Column(
                              children: const [
                                QouteWidgt(),
                              ],
                            ),
                            Column(
                              children: List.generate(
                                  10, (index) => const ProjectDisplay()),
                            )
                          ],

                          // return list item widget here
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}

class ProjectDisplay extends StatelessWidget {
  const ProjectDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 850,
      width: 500,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onSecondary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 50,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 630,
            width: double.infinity,
            color: Colors.pink,
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: AutoSizeText(
                    "Title",
                    style: GoogleFonts.poppins(
                        textStyle: context.theme.textTheme.titleLarge!
                            .copyWith(fontWeight: FontWeight.bold)),
                  ),
                ),
                5.height,
                SizedBox(
                  width: double.infinity,
                  child: AutoSizeText(
                    "this is the discription of the projeddsfsfsdf sdffdsfsdfdf sfsf sfsf sfsfsfsfsf ssffsf sfsf sff werwerwrr werwrwe rwrrw wrwr wrwr werwerwr wrewrwe rwrwrw rr",
                    style: context.theme.textTheme.bodyMedium!.copyWith(),
                  ),
                ),
                10.height,
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                      ),
                      onPressed: () {},
                      child: const AutoSizeText("GitHub"),
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class QouteWidgt extends StatelessWidget {
  const QouteWidgt({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.all(70),
      width: 500,
      decoration: BoxDecoration(
        color: context.theme.colorScheme.onSecondary,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 50,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          const SizedBox(
              height: 50,
              width: 50,
              child: FittedBox(
                  fit: BoxFit.fitHeight,
                  child: FaIcon(FontAwesomeIcons.quoteRight))),
          10.height,
          const AutoSizeText(
            '"It is no measure of health to be well adjusted to a profoundly sick society."',
            textAlign: TextAlign.center,
          ),
          25.height,
          const AutoSizeText('Bright')
        ],
      ),
    );
  }
}

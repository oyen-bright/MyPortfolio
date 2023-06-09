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
import 'package:responsive_builder/responsive_builder.dart';
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
                        image: AssetImage(
                            "assets/background/pngwing.com (1).png"))),
                child: ScreenTypeLayout.builder(
                  mobile: (BuildContext context) {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          CurrentworkingonDisplay(bigStyle: bigStyle),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: ProjectsView(),
                          ),
                        ],
                      ),
                    );
                  },
                  tablet: (BuildContext context) {
                    return ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context)
                          .copyWith(scrollbars: false),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          CurrentworkingonDisplay(bigStyle: bigStyle),
                          const ProjectsView(),
                        ],
                      ),
                    );
                  },
                  desktop: (BuildContext context) {
                    return ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context)
                            .copyWith(scrollbars: false),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: context.height / 7),
                                child:
                                    CurrentworkingonDisplay(bigStyle: bigStyle),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: ListView(
                                controller: scrollController,
                                children: [
                                  150.height,
                                  50.height,
                                  const ProjectsView(),
                                ],

                                // return list item widget here
                              ),
                            ),
                          ],
                        ));
                  },
                ))
          ],
        ),
      ),
    );
  }
}

class ProjectsView extends StatelessWidget {
  const ProjectsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const QouteWidgt(),
        Column(
          children: List.generate(10, (index) => const ProjectDisplay()),
        )
      ],
    );
  }
}

class CurrentworkingonDisplay extends StatelessWidget {
  const CurrentworkingonDisplay({
    super.key,
    required this.bigStyle,
  });

  final TextStyle bigStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            child: AutoSizeText("Currently".toUpperCase(),
                maxLines: 1, textAlign: TextAlign.left, style: bigStyle),
          ),
          SizedBox(
            width: double.infinity,
            child: TextLiquidFill(
              boxWidth: double.infinity,
              loadUntil: 0.8,
              text: 'Working on'.toUpperCase(),
              textAlign: TextAlign.center,
              waveColor: context.theme.colorScheme.primary,
              boxBackgroundColor:
                  context.theme.colorScheme.brightness == Brightness.light
                      ? const Color.fromRGBO(255, 253, 143, 1)
                      : const Color.fromRGBO(163, 163, 61, 1),
              textStyle: bigStyle,
              boxHeight: 120,
            ),
          ),
        ],
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
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.pink,
            ),
          ),
          SizedBox(
              height: 220,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 35),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
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
                      height: 80,
                      width: double.infinity,
                      child: AutoSizeText(
                        textAlign: TextAlign.justify,
                        "this is the discription of the projeddsfsfsdf sdffdsfsdfdf sfsf sfsf sfsfsfsfsf ssffsf sfsf sff werwerwrr werwrwe rwrrw wrwr wrwr werwerwr wrewrwe rwrwrw rr",
                        style: context.theme.textTheme.bodyMedium!.copyWith(),
                      ),
                    ),
                    5.height,
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

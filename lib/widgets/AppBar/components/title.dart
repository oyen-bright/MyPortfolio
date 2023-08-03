import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/methods/emoji_generator.dart';
import 'package:random_text_reveal/random_text_reveal.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (_) {
      bool isFinished = true;
      return Row(
        children: [
          Expanded(
            child: Builder(builder: (_) {
              if (isFinished) {
                return SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        // const Text("Bright's  "),
                        AnimatedTextKit(
                          repeatForever: true,
                          // onFinished: () =>
                          //     setState(() => isFinished = false),
                          animatedTexts: [
                            FadeAnimatedText('Portefeuille ${emoji()}'),
                            FadeAnimatedText('文件夹 ${emoji()}'),
                            FadeAnimatedText('портфолио ${emoji()}'),
                            FadeAnimatedText('ポートフォリオ ${emoji()}'),
                          ],
                        ),
                      ],
                    ));
              }
              return const RandomTextReveal(
                text: "Bright's Portfolio ✌️",
                duration: Duration(milliseconds: 1500),
              );
            }),
          ),
        ],
      );
    });
  }
}

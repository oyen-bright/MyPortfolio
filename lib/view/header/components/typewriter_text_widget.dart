import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/constants.dart';
import 'package:my_portfolio/data/data.dart';

class TypeWriterTextWidget extends StatelessWidget {
  final double fontSize;
  final bool centerText;

  const TypeWriterTextWidget(
      {Key? key, required this.fontSize, this.centerText = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textAlign = centerText ? TextAlign.center : TextAlign.left;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          Data.headerData['title'],
          textAlign: textAlign,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        DefaultTextStyle(
          style: Theme.of(context)
                  .textTheme
                  .displayLarge
                  ?.copyWith(fontSize: fontSize) ??
              const TextStyle(),
          child: AnimatedTextKit(
            stopPauseOnTap: true,
            pause: Constants.kAnimationDuration,
            displayFullTextOnTap: true,
            repeatForever: true,
            animatedTexts: (Data.headerData['subtitle'] as List<String>)
                .map(
                  (e) => TypewriterAnimatedText(
                    e,
                    textAlign: textAlign,
                    speed: Constants.kTypeWriterSpeed,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

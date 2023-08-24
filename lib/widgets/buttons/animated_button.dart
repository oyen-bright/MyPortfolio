import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';

class AnimatedButton extends StatefulWidget {
  final String title;
  final void Function()? onPressed;
  const AnimatedButton({
    super.key,
    this.onPressed,
    required this.title,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> _textAndIconColor;
  late AnimationController _controller;

  bool _isHovering = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Constants.kIconButtonAnimationDuration,
    );
    _textAndIconColor = ColorTween(
      begin: Colors.black,
      end: Colors.white,
    ).animate(_controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _controller.forward();
          _isHovering = true;
        });
      },
      onExit: (_) {
        setState(() {
          _controller.reverse();
          _isHovering = false;
        });
      },
      child: ElevatedButton(
        onPressed: widget.onPressed ?? () {},
        style: ElevatedButton.styleFrom(
            foregroundColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            disabledForegroundColor: Colors.transparent.withOpacity(0.38),
            disabledBackgroundColor: Colors.transparent.withOpacity(0.12),
            elevation: 0,
            surfaceTintColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: const RoundedRectangleBorder(side: BorderSide()),
            padding: EdgeInsets.zero),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: AnimatedContainer(
                width: _isHovering ? context.width : 0,
                duration: Constants.kIconButtonAnimationDuration,
                color: Colors.black,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                widget.title,
                style: context.theme.textTheme.bodyLarge!
                    .copyWith(color: _textAndIconColor.value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

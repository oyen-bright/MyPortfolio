// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/screen_size_extention.dart';
import 'package:my_portfolio/constants.dart';

class AnimatedIconWidget extends StatefulWidget {
  final IconData iconData;
  final AnimationController controller;
  final Color backgroundColor;
  final Color? hoveredColor;
  final Duration backgroundAnimationDuration;
  final void Function()? onPressed;
  final String? toolTipMessage;

  const AnimatedIconWidget({
    Key? key,
    required this.iconData,
    required this.controller,
    required this.backgroundColor,
    this.hoveredColor,
    required this.backgroundAnimationDuration,
    this.onPressed,
    this.toolTipMessage,
  }) : super(key: key);

  @override
  AnimatedIconWidgetState createState() => AnimatedIconWidgetState();
}

class AnimatedIconWidgetState extends State<AnimatedIconWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        widget.controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        widget.controller.reset();
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 5),
        child: IconButton(
          style: IconButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.transparent,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: widget.onPressed,
          icon: Tooltip(
            margin: const EdgeInsets.only(top: 10),
            waitDuration: Constants.kToolTipWaitDuration,
            message: widget.toolTipMessage,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  child: AnimatedContainer(
                    width: isHovered ? context.width : 0,
                    curve: Curves.fastOutSlowIn,
                    duration: widget.backgroundAnimationDuration,
                    color: widget.backgroundColor,
                  ),
                ),
                RotationTransition(
                  turns: widget.controller,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: FaIcon(
                      widget.iconData,
                      size: isHovered ? 30 : null,
                      color: isHovered
                          ? widget.hoveredColor ?? Colors.white
                          : null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

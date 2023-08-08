import 'package:flutter/material.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/constants.dart';

class ExpandMoreWidget extends StatefulWidget {
  const ExpandMoreWidget(
      {super.key, required this.onTap, required this.showDownArrow});

  final void Function()? onTap;
  final bool showDownArrow;

  @override
  State<ExpandMoreWidget> createState() => _ExpandMoreWidgetState();
}

class _ExpandMoreWidgetState extends State<ExpandMoreWidget> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHovered = true;
        }),
        onExit: (event) => setState(() {
          isHovered = false;
        }),
        child: AnimatedContainer(
          duration: Constants.kAnimationDuration,
          curve: Curves.easeInOutCubic,
          width: double.infinity,
          height: !widget.showDownArrow ? 0 : Constants.kExpandButtonHeight,
          child: Icon(
            Icons.expand_more,
            color: isHovered
                ? context.theme.brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black
                : Colors.grey,
            size: 50,
          ),
        ),
      ),
    );
  }
}

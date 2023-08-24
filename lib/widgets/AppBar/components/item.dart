import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';

class MenuItem extends StatefulWidget {
  const MenuItem({super.key, required this.titleInformation});
  final Map titleInformation;

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  int onHoverSize = 0;

  @override
  Widget build(BuildContext context) {
    final fontSize = context.theme.textTheme.bodyMedium!.fontSize;

    return MouseRegion(
      onHover: (_) => setState(() => onHoverSize = 3),
      onExit: (_) => setState(() => onHoverSize = 0),
      child: TextButton(
        onPressed: () {
          context.go(widget.titleInformation['route']);
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeIn,
          style: context.theme.textTheme.bodyMedium!.copyWith(
              fontSize: fontSize,
              fontWeight:
                  onHoverSize == 0 ? FontWeight.normal : FontWeight.bold),
          child: Text(
            widget.titleInformation["Title"],
          ),
        ),
      ),
    );
  }
}

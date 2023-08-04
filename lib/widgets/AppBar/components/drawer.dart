import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/data/data.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                opacity: 0.2,
                image: AssetImage("assets/background/PngItem_169637.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              width: double.infinity,
              child: Text('Menu',
                  style: context.theme.textTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.bold)),
            )),
        for (final sectionTitle in Data.sectionTitles)
          MenuListTile(
            sectionTitle: sectionTitle,
          ),
      ]),
    );
  }
}

class MenuListTile extends StatefulWidget {
  const MenuListTile({super.key, required this.sectionTitle});
  final Map sectionTitle;

  @override
  State<MenuListTile> createState() => _MenuListTileState();
}

class _MenuListTileState extends State<MenuListTile> {
  int onHoverSize = 0;

  @override
  Widget build(BuildContext context) {
    final fontSize = context.theme.textTheme.titleSmall!.fontSize;

    return MouseRegion(
      onHover: (_) => setState(() => onHoverSize = 3),
      onExit: (_) => setState(() => onHoverSize = 0),
      child: ListTile(
        iconColor: context.theme.iconTheme.color,
        title: Text(
          widget.sectionTitle["Title"],
          style:
              context.theme.textTheme.titleSmall!.copyWith(fontSize: fontSize),
        ),
        onTap: () {
          Navigator.pop(context);
        },
        leading: SizedBox(
          width: 20,
          height: 20,
          child: Align(
              alignment: Alignment.center,
              child: FaIcon(widget.sectionTitle["Icon"])),
        ),
      ),
    );
  }
}

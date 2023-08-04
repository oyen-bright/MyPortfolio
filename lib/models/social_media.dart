import 'package:flutter/cupertino.dart';

class SocialMedia {
  final IconData name;
  final String link;
  final String toolTip;
  final Color color;

  const SocialMedia({
    required this.toolTip,
    required this.name,
    required this.link,
    required this.color,
  });
}

import 'package:flutter/material.dart';

extension CustomThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

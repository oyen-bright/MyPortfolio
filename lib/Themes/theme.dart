import 'package:flutter/material.dart';

const backgroundColor = Color.fromRGBO(232, 226, 226, 1);

ThemeData lightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
      appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
  ));
}

ThemeData darkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith();
}

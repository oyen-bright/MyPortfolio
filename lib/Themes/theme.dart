import 'package:flutter/material.dart';

// const backgroundColor = Color.fromRGBO(232, 226, 226, 1);

ThemeData lightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
      bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.1),
          shape: const RoundedRectangleBorder()),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
      ),
      appBarTheme: const AppBarTheme(

          // backgroundColor: backgroundColor,
          ));
}

ThemeData darkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith();
}

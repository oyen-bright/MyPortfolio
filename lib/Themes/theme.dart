import 'package:flutter/material.dart';

// const backgroundColor = Color.fromRGBO(232, 226, 226, 1);

ThemeData lightTheme() {
  return ThemeData.light(useMaterial3: true).copyWith(
      bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.03),
          shape: const RoundedRectangleBorder()),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
      ),
      appBarTheme: const AppBarTheme(

          // backgroundColor: backgroundColor,
          ));
}

ThemeData darkTheme() {
  return ThemeData.dark(useMaterial3: true).copyWith(
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        shape: const RoundedRectangleBorder(),
        // backgroundColor: Colors.white.withOpacity(0.03)
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      // surfaceTintColor: Colors.transparent,
      // backgroundColor: Colors.transparent,
      // shadowColor: Colors.transparent,
      shape: const RoundedRectangleBorder(),
    )),
    bottomSheetTheme: BottomSheetThemeData(
        modalBackgroundColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.black.withOpacity(0.03),
        shape: const RoundedRectangleBorder()),
  );
}

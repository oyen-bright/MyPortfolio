import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/data/data.dart';

// const backgroundColor = Color.fromRGBO(232, 226, 226, 1);

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData.light(useMaterial3: true).copyWith(
        bottomSheetTheme: BottomSheetThemeData(
            modalBackgroundColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.black.withOpacity(0.03),
            shape: const RoundedRectangleBorder()),
        textTheme: _textTheme,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
        ));
  }

  static ThemeData darkTheme() {
    return ThemeData.dark(useMaterial3: true).copyWith(
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(shape: const RoundedRectangleBorder()),
      ),
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          shape: const RoundedRectangleBorder(),
        ),
      ),
      textTheme: GoogleFonts.montserratTextTheme(_textTheme),
      bottomSheetTheme: BottomSheetThemeData(
          modalBackgroundColor: Colors.transparent,
          elevation: 0,
          backgroundColor: Colors.black.withOpacity(0.03),
          shape: const RoundedRectangleBorder()),
    );
  }

  static ColorScheme lightColorScheme = const ColorScheme.light(
    primary: AppColors.primaryColor,
    secondary: AppColors.secondaryColor,
    background: AppColors.primaryColor,
    surface: AppColors.primaryColor,
    onBackground: Colors.white,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
  );

  static const _bold = FontWeight.w700;
  static const _semiBold = FontWeight.w600;
  static const _medium = FontWeight.w500;
  static const _regular = FontWeight.w400;
  static const _light = FontWeight.w300;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.monoton(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 96,
      color: AppColors.black,

      fontStyle: FontStyle.normal,
    ),
    displayMedium: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 60,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    displaySmall: GoogleFonts.roboto(
      fontSize: 48,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineMedium: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 34,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    headlineSmall: GoogleFonts.roboto(
      fontSize: 24,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleLarge: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 21,
      color: AppColors.black,
      fontWeight: _bold,
      fontStyle: FontStyle.normal,
    ),
    titleMedium: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 19,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    titleSmall: GoogleFonts.roboto(
      fontSize: 17,
      color: AppColors.secondaryColor,
      fontWeight: _semiBold,
      fontStyle: FontStyle.normal,
    ),
    bodyLarge: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 16,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    bodyMedium: GoogleFonts.roboto(
      fontSize: 15,
      color: AppColors.secondaryColor,
      fontWeight: _light,
      fontStyle: FontStyle.normal,
    ),
    labelLarge: GoogleFonts.roboto(
      fontSize: 14,
      color: AppColors.secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: _medium,
    ),
    bodySmall: const TextStyle(
      // fontFamily: StringConst.VISUELT_PRO,
      fontSize: 14,
      color: AppColors.black,
      fontWeight: _regular,
      fontStyle: FontStyle.normal,
    ),
  );
}

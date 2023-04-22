import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Themes/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            theme: lightTheme(), currentTheme: CurrentTheme.lightTheme));

  void switchTheme() {
    if (state.currentTheme == CurrentTheme.lightTheme) {
      emit(
          ThemeState(theme: darkTheme(), currentTheme: CurrentTheme.darkTheme));
    } else {
      emit(ThemeState(
          theme: lightTheme(), currentTheme: CurrentTheme.lightTheme));
    }
  }

  ThemeData getLightTheme() {
    return lightTheme();
  }

  ThemeData getDarkTheme() {
    return darkTheme();
  }
}

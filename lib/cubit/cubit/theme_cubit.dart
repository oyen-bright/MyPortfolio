import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/Themes/theme.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
            theme: AppTheme.lightTheme(),
            currentTheme: CurrentTheme.lightTheme));

  void switchTheme() {
    if (state.currentTheme == CurrentTheme.lightTheme) {
      emit(ThemeState(
          theme: AppTheme.darkTheme(), currentTheme: CurrentTheme.darkTheme));
    } else {
      emit(ThemeState(
          theme: AppTheme.lightTheme(), currentTheme: CurrentTheme.lightTheme));
    }
  }

  ThemeData getLightTheme() {
    return AppTheme.lightTheme();
  }

  ThemeData getDarkTheme() {
    return AppTheme.darkTheme();
  }
}

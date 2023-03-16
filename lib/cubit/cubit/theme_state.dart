part of 'theme_cubit.dart';

enum CurrentTheme { lightTheme, darkTheme }

class ThemeState {
  final ThemeData theme;
  final CurrentTheme currentTheme;

  const ThemeState({required this.theme, required this.currentTheme});
}

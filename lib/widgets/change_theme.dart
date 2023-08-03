import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/theme_cubit.dart';

class ChangeTheme extends StatelessWidget {
  const ChangeTheme({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Tooltip(
            message: "Click to change theme",
            child: DayNightSwitcher(
              moonColor: context.theme.appBarTheme.backgroundColor,
              sunColor: context.theme.appBarTheme.backgroundColor,
              dayBackgroundColor: context.theme.scaffoldBackgroundColor,
              isDarkModeEnabled: state.currentTheme == CurrentTheme.darkTheme,
              onStateChanged: (_) {
                context.read<ThemeCubit>().switchTheme();
              },
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/Extentions/theme_extention.dart';
import 'package:my_portfolio/cubit/cubit/project_section_scroll_cubit.dart';
import 'package:my_portfolio/cubit/cubit/scroll_cubit.dart';
import 'package:my_portfolio/cubit/cubit/theme_cubit.dart';
import 'package:my_portfolio/services/send_email.dart';
import 'package:my_portfolio/view/desktop_view.dart';
import 'package:my_portfolio/view/mobile_view.dart';
import 'package:my_portfolio/view/tablet_view.dart';
import 'package:responsive_builder/responsive_builder.dart';

void main() async {
  ResponsiveSizingConfig.instance.setCustomBreakpoints(
    const ScreenBreakpoints(desktop: 800, tablet: 700, watch: 200),
  );

  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final locator = GetIt.instance;
  locator.registerLazySingleton(() => Services());

  // await Firebase.initializeApp();
  // FlutterError.onError = (errorDetails) {
  //   FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  // };

  runApp(const MyApp());

  // runZonedGuarded(() => runApp(const MyApp()),
  //     (Object error, StackTrace stackTrace) {
  //   FirebaseCrashlytics.instance.recordError(error, stackTrace);
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final analytics = FirebaseAnalytics.instance;

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<ScrollCubit>(
          create: (context) => ScrollCubit(),
        ),
        BlocProvider<ProjectSectionScrollCubit>(
          create: (context) => ProjectSectionScrollCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          final isDarkMode = state.currentTheme == CurrentTheme.darkTheme;

          print(isDarkMode);
          return MaterialApp(
            navigatorObservers: const [
              // FirebaseAnalyticsObserver(analytics: analytics),
            ],
            debugShowCheckedModeBanner: false,
            title: 'Oyeniyi Bright | Portfolio',
            theme: context.read<ThemeCubit>().getLightTheme(),
            darkTheme: context.read<ThemeCubit>().getDarkTheme(),
            themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.system,
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              physics: const BouncingScrollPhysics(),
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.trackpad,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            home: const Home(),
          );
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    print(context.theme.scaffoldBackgroundColor);
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const MobileView(),
      tablet: (BuildContext context) => const TabletView(),
      desktop: (BuildContext context) => const DesktopView(),
    );
  }
}

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';
import 'package:my_portfolio/cubit/cubit/project_section_scroll_cubit.dart';
import 'package:my_portfolio/cubit/cubit/scroll_cubit.dart';
import 'package:my_portfolio/cubit/cubit/theme_cubit.dart';
import 'package:my_portfolio/services/services.dart';
import 'package:my_portfolio/view/desktop_view.dart';
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

          return MaterialApp(
            navigatorObservers: const [
              // FirebaseAnalyticsObserver(analytics: analytics),
            ],
            debugShowCheckedModeBanner: false,
            title: 'BRINNIXS',
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
            home: const HomeLoading(),
          );
        },
      ),
    );
  }
}

class HomeLoading extends StatefulWidget {
  const HomeLoading({super.key});

  @override
  State<HomeLoading> createState() => _HomeLoadingState();
}

class _HomeLoadingState extends State<HomeLoading> {
  bool showLoadingIndicator = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2),
        () => setState(() => showLoadingIndicator = true));
  }

  @override
  Widget build(BuildContext context) {
    if (false) {
      return Container(
        color: const Color(0xFFECE8EB), // Us
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                  duration: const Duration(seconds: 10),
                  padding: !showLoadingIndicator
                      ? null
                      : const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "assets/logos/LOGO.png",
                    scale: 4,
                  )),
              if (showLoadingIndicator)
                const SizedBox(
                  width: 200,
                  child: LinearProgressIndicator(
                    color: Colors.black,
                  ),
                )
            ],
          ),
        ),
      );
    }

    return const DesktopView();
  }
}

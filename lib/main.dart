import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sea_night_be_brave/providers/providers.dart';
import 'package:sea_night_be_brave/screens/game_screen.dart';
import 'package:sea_night_be_brave/screens/screens.dart';
import 'package:sea_night_be_brave/services/preferences_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

    final preferences = await SharedPreferences.getInstance();

    runApp(ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MyApp(preferences: preferences);
      },
    ));
  }, (error, stack) {
    debugPrint(error.toString());
    debugPrintStack(stackTrace: stack);
  });
}

CustomTransitionPage buildPageWithDefaultTransition({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
  bool opaque = true,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration.zero,
    opaque: opaque,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.preferences});

  final SharedPreferences preferences;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _router = GoRouter(
      routes: [
        ShellRoute(
          pageBuilder: (context, state, child) {
            return buildPageWithDefaultTransition(
              context: context,
              state: state,
              child: NavigationScreen(
                path: state.fullPath ?? '/',
                child: child,
              ),
            );
          },
          routes: [
            GoRoute(
              path: '/',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const MainScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'game',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const GameScreen(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/store',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const StoreScreen(),
                );
              },
              routes: [
                GoRoute(
                  path: 'bg',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const BackgroundsScreen(),
                    );
                  },
                ),
                GoRoute(
                  path: 'characters',
                  pageBuilder: (context, state) {
                    return buildPageWithDefaultTransition(
                      context: context,
                      state: state,
                      child: const CharactersScreen(),
                    );
                  },
                ),
              ],
            ),
            GoRoute(
              path: '/settings',
              pageBuilder: (context, state) {
                return buildPageWithDefaultTransition(
                  context: context,
                  state: state,
                  child: const SettingsScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => PreferencesService(
            preferences: widget.preferences,
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => StoreProvider(
            service: Provider.of(context, listen: false),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LevelManager(router: _router),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}

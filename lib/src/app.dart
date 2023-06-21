import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/src/features/movies/repo/movie_repository.dart';
import 'package:movie_app/src/features/movies/service/movie_store.dart';
import 'package:movie_app/src/features/settings/service/app_settings_store.dart';
import 'package:movie_app/src/features/settings/service/settings_service.dart';
import 'package:movie_app/src/localization/l10n/app_localizations.dart';
import 'package:movie_app/src/routing/app_router.dart';
import 'package:movie_app/src/utils/styles.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'utils/typography.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({super.key, this.prefs});

  final AppRouter _appRouter = AppRouter();
  final SharedPreferences? prefs;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<SettingsService>(create: (_) => SettingsService(prefs!)),
          ProxyProvider<SettingsService, AppStore>(
              update: (BuildContext context, SettingsService repo, __) {
            return AppStore(settingsService: repo);
          }),
          Provider<MovieRepository>(create: (_) => MovieRepository()),
          ProxyProvider<MovieRepository, MovieStore>(
            update: (_, MovieRepository repo, __) {
              return MovieStore(repo);
            },
          ),
          // Provider<AuthRepository>(create: (_) => AuthRepository()),
          // ProxyProvider<AuthRepository, AuthStore>(
          //   update: (BuildContext context, AuthRepository repo, __) {
          //     return AuthStore(repo);
          //   },
          // ),
        ],
        child: Consumer<AppStore>(
          builder: (BuildContext context, AppStore store, Widget? child) {
            return Observer(
              builder: (BuildContext context) {
                return MaterialApp.router(
                  title: 'Movie app',
                  restorationScopeId: 'app',
                  localizationsDelegates: const [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.supportedLocales,
                  debugShowCheckedModeBanner: false,
                  onGenerateTitle: (BuildContext context) =>
                      S.of(context).appTitle,
                  theme: ThemeData(
                      textTheme: textTheme,
                      useMaterial3: true,
                      colorScheme: ColorScheme.fromSeed(
                          seedColor: Platform.isIOS
                              ? AppColor.primary
                              : const Color.fromARGB(255, 31, 63, 150))),
                  darkTheme: ThemeData.dark(),
                  themeMode: store.themeMode,
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: AutoRouterDelegate(
                    _appRouter,
                    navigatorObservers: () =>
                        <NavigatorObserver>[AutoRouteObserver()],
                    // routes: (BuildContext context) {
                    //   return <PageRouteInfo<dynamic>>[const HomeRoute()];
                    // },
                  ),
                  builder: (_, Widget? router) {
                    return router!;
                  },
                );
              },
            );
          },
        ));
  }
}

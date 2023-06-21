import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/src/routing/app_router.dart';
import 'package:movie_app/src/utils/color_schemes.g.dart';
import 'package:movie_app/src/utils/custom_color.g.dart';
import 'package:movie_app/src/utils/styles.dart';
import 'package:movie_app/src/utils/typography.dart';
import 'package:provider/provider.dart';

import 'features/authentication/presentation/user_screen.dart';
import 'features/movies/presentation/pages/all_movies_page.dart';
import 'features/movies/repo/movie_repository.dart';
import 'features/movies/service/movie_store.dart';
import 'features/settings/service/app_settings_store.dart';
import 'features/settings/service/settings_service.dart';
import 'features/watch_list/presentation/watch_list.dart';
import 'localization/l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var sharedPreferences = await SharedPreferences.getInstance();

  runApp(MyApp(
    prefs: sharedPreferences,
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.prefs});
  final AppRouter _appRouter = AppRouter();
  final SharedPreferences? prefs;

  // This widget is the root of your application.
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
          )
        ],
        child: Consumer<AppStore>(
            builder: (BuildContext context, AppStore appStore, Widget? child) {
          return Observer(builder: (BuildContext context) {
            return DynamicColorBuilder(
              builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
                ColorScheme lightScheme;
                ColorScheme darkScheme;

                if (lightDynamic != null && darkDynamic != null) {
                  lightScheme = lightDynamic.harmonized();
                  lightCustomColors = lightCustomColors.harmonized(lightScheme);

                  // Repeat for the dark color scheme.
                  darkScheme = darkDynamic.harmonized();
                  darkCustomColors = darkCustomColors.harmonized(darkScheme);
                } else {
                  // Otherwise, use fallback schemes.
                  lightScheme = lightColorScheme;
                  darkScheme = darkColorScheme;
                }

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
                      useMaterial3: true,
                      colorScheme: lightScheme,
                      extensions: [lightCustomColors],
                      primaryColor: AppColor.primary,
                      textTheme: textTheme),
                  darkTheme: ThemeData(
                      useMaterial3: true,
                      colorScheme: darkScheme,
                      extensions: [darkCustomColors],
                      primaryColor: AppColor.primary,
                      textTheme: textTheme),
                  themeMode: ThemeMode.system,
                  routeInformationParser: _appRouter.defaultRouteParser(),
                  routerDelegate: AutoRouterDelegate(_appRouter,
                      navigatorObservers: () =>
                          <NavigatorObserver>[AutoRouteObserver()]),
                  builder: (_, Widget? router) {
                    return router!;
                  },
                );
              },
            );
          });
        }));
  }
}

final GlobalKey<ScaffoldState> homeScaffoldKey = GlobalKey<ScaffoldState>();

@RoutePage<dynamic>()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int currentPageIndex = 0;
  AppStore? appSettingsStore;
  MovieStore? movieStore;

  late Map<String, Icon> _navigationItems;
  final List<Widget> pages = <Widget>[
    const AllMoviesPage(),
    const WatchListScreen(),
    const ProfileScreen(),
  ];

  Map<String, Icon> _getNavItems(BuildContext context) {
    return {
      S.of(context).allMovies: Platform.isIOS
          ? const Icon(CupertinoIcons.film_fill)
          : const Icon(Icons.movie),
      S.of(context).watchList: Platform.isIOS
          ? const Icon(CupertinoIcons.heart_solid)
          : const Icon(Icons.favorite),
      S.of(context).profile: Platform.isIOS
          ? const Icon(CupertinoIcons.person_solid)
          : const Icon(Icons.person),
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appSettingsStore ??= Provider.of<AppStore>(context);
    movieStore ??= Provider.of<MovieStore>(context);
    movieStore!.getAllMovies();
  }

  void switchPage(int index) {
    setState(() {
      currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    _navigationItems = _getNavItems(context);
    return Platform.isIOS
        ? CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              currentIndex: currentPageIndex,
              iconSize: 32,
              height: 64,
              onTap: (index) => switchPage(index),
              items: _navigationItems.entries
                  .map<BottomNavigationBarItem>(
                      (entry) => BottomNavigationBarItem(
                            icon: entry.value,
                            label: entry.key,
                          ))
                  .toList(),
            ),
            tabBuilder: (context, index) {
              late final CupertinoTabView returnValue;
              switch (index) {
                case 0:
                  returnValue = CupertinoTabView(
                      builder: (context) => const AllMoviesPage());
                  break;
                case 1:
                  returnValue = CupertinoTabView(
                      builder: (context) => const WatchListScreen());
                  break;
                case 2:
                  returnValue = CupertinoTabView(
                      builder: (context) => const ProfileScreen());
                  break;
              }
              return returnValue;
            },
          )
        : Scaffold(
            body: pages[currentPageIndex],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (int index) => switchPage(index),
              selectedIndex: currentPageIndex,
              destinations: _navigationItems.entries
                  .map<Widget>((entry) => NavigationDestination(
                        icon: entry.value,
                        label: entry.key,
                      ))
                  .toList(),
              animationDuration: const Duration(milliseconds: 600),
            ),
          );
  }
}

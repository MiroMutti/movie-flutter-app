import 'package:auto_route/auto_route.dart';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/src/features/movies/service/movie_store.dart';
import 'package:movie_app/src/features/settings/service/app_settings_store.dart';
import 'package:movie_app/src/localization/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'authentication/presentation/user_screen.dart';
import 'movies/presentation/pages/all_movies_page.dart';
import 'watch_list/presentation/watch_list.dart';

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

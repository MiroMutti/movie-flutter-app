// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i8;
import 'package:movie_app/src/features/authentication/presentation/user_screen.dart'
    as _i5;
import 'package:movie_app/src/features/home.dart' as _i2;
import 'package:movie_app/src/features/movies/models/movie.dart' as _i11;
import 'package:movie_app/src/features/movies/presentation/pages/all_movies_page.dart'
    as _i4;
import 'package:movie_app/src/features/movies/presentation/pages/movie_details_page.dart'
    as _i3;
import 'package:movie_app/src/features/settings/presentation/settings_page.dart'
    as _i1;
import 'package:movie_app/src/features/settings/service/app_settings_store.dart'
    as _i9;
import 'package:movie_app/src/features/watch_list/presentation/watch_list.dart'
    as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    SettingsRoute.name: (routeData) {
      final args = routeData.argsAs<SettingsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SettingsPage(
          key: args.key,
          appSettingsStore: args.appSettingsStore,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomePage(),
      );
    },
    MovieDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MovieDetailsRouteArgs>();
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.MovieDetailsPage(
          key: args.key,
          movie: args.movie,
        ),
      );
    },
    AllMoviesRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AllMoviesPage(),
      );
    },
    ProfileScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ProfileScreen(),
      );
    },
    WatchListScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WatchListScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    _i8.Key? key,
    required _i9.AppStore appSettingsStore,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(
            key: key,
            appSettingsStore: appSettingsStore,
          ),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i7.PageInfo<SettingsRouteArgs> page =
      _i7.PageInfo<SettingsRouteArgs>(name);
}

class SettingsRouteArgs {
  const SettingsRouteArgs({
    this.key,
    required this.appSettingsStore,
  });

  final _i8.Key? key;

  final _i9.AppStore appSettingsStore;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key, appSettingsStore: $appSettingsStore}';
  }
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.MovieDetailsPage]
class MovieDetailsRoute extends _i7.PageRouteInfo<MovieDetailsRouteArgs> {
  MovieDetailsRoute({
    _i10.Key? key,
    required _i11.Movie movie,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          MovieDetailsRoute.name,
          args: MovieDetailsRouteArgs(
            key: key,
            movie: movie,
          ),
          initialChildren: children,
        );

  static const String name = 'MovieDetailsRoute';

  static const _i7.PageInfo<MovieDetailsRouteArgs> page =
      _i7.PageInfo<MovieDetailsRouteArgs>(name);
}

class MovieDetailsRouteArgs {
  const MovieDetailsRouteArgs({
    this.key,
    required this.movie,
  });

  final _i10.Key? key;

  final _i11.Movie movie;

  @override
  String toString() {
    return 'MovieDetailsRouteArgs{key: $key, movie: $movie}';
  }
}

/// generated route for
/// [_i4.AllMoviesPage]
class AllMoviesRoute extends _i7.PageRouteInfo<void> {
  const AllMoviesRoute({List<_i7.PageRouteInfo>? children})
      : super(
          AllMoviesRoute.name,
          initialChildren: children,
        );

  static const String name = 'AllMoviesRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ProfileScreen]
class ProfileScreen extends _i7.PageRouteInfo<void> {
  const ProfileScreen({List<_i7.PageRouteInfo>? children})
      : super(
          ProfileScreen.name,
          initialChildren: children,
        );

  static const String name = 'ProfileScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WatchListScreen]
class WatchListScreen extends _i7.PageRouteInfo<void> {
  const WatchListScreen({List<_i7.PageRouteInfo>? children})
      : super(
          WatchListScreen.name,
          initialChildren: children,
        );

  static const String name = 'WatchListScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/src/common_widgets/no_data.dart';
import 'package:movie_app/src/features/movies/presentation/movies_list.dart';
import 'package:movie_app/src/features/settings/service/app_settings_store.dart';
import 'package:movie_app/src/utils/styles.dart';
import 'package:provider/provider.dart';

import '../../../../localization/l10n/app_localizations.dart';
import '../../service/movie_store.dart';

@RoutePage<dynamic>()
class AllMoviesPage extends StatefulWidget {
  const AllMoviesPage({super.key});

  @override
  State<AllMoviesPage> createState() => _AllMoviesPageState();
}

class _AllMoviesPageState extends State<AllMoviesPage> {
  AppStore? appSettingsStore;
  MovieStore? movieStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieStore ??= Provider.of<MovieStore>(context);
    movieStore?.getAllMovies();
    appSettingsStore ??= Provider.of<AppStore>(context);
  }

  Widget _buildLoadingIndicator() {
    return const SliverFillRemaining(
      hasScrollBody: false,
      fillOverscroll: true,
      child: Center(
          child: SpinKitFadingCube(
        size: 80,
        color: AppColor.primary,
      )),
    );
  }

  Widget _buildErrorMsg() {
    return SliverToBoxAdapter(
      child: Center(
        child: Text('An error has occurred! ${movieStore!.error.toString()}'),
      ),
    );
  }

  @override
  void dispose() {
    movieStore!.reset();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          backgroundColor: AppColor.primary,
          pinned: true,
          floating: true,
          expandedHeight: MediaQuery.of(context).size.height / 3,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Image.asset(
              'assets/images/header.png',
              fit: BoxFit.cover,
            ),
            title: Text(
              S.of(context).movieTime,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          // actions: [
          //   IconButton.filled(
          //       onPressed: () => context.router
          //           .push(SettingsRoute(appSettingsStore: appSettingsStore!)),
          //       icon: Icon(CupertinoIcons.settings))
          // ],
        ),
        const SliverPadding(padding: EdgeInsets.only(top: 24)),
        Observer(builder: (BuildContext context) {
          return movieStore!.loading
              ? _buildLoadingIndicator()
              : movieStore!.error!.isNotEmpty
                  ? _buildErrorMsg()
                  : movieStore!.allMovies.isNotEmpty
                      ? MoviesList(movies: movieStore!.allMovies)
                      : const SliverToBoxAdapter(child: NoData(msg: 'No Data'));
        }),
      ],
    );
  }
}

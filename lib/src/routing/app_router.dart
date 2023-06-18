import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  final List<AutoRoute> routes = [
    AdaptiveRoute(page: HomeRoute.page, path: '/'),
    AdaptiveRoute(page: ProfileScreen.page, path: '/user-details'),
    AdaptiveRoute(page: MovieDetailsRoute.page, path: '/movie-details'),
    AdaptiveRoute(page: SettingsRoute.page, path: '/settings')
  ];
}

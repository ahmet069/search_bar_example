// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const SplashView(),
      );
    },
    HomeRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const HomeView(),
      );
    },
    SearchRoute.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const SearchView(),
        transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
        durationInMilliseconds: 200,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          SplashRouter.name,
          path: '/',
        ),
        RouteConfig(
          HomeRouter.name,
          path: '/homeView',
        ),
        RouteConfig(
          SearchRoute.name,
          path: '/search-view',
        ),
      ];
}

/// generated route for
/// [SplashView]
class SplashRouter extends PageRouteInfo<void> {
  const SplashRouter()
      : super(
          SplashRouter.name,
          path: '/',
        );

  static const String name = 'SplashRouter';
}

/// generated route for
/// [HomeView]
class HomeRouter extends PageRouteInfo<void> {
  const HomeRouter()
      : super(
          HomeRouter.name,
          path: '/homeView',
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [SearchView]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/search-view',
        );

  static const String name = 'SearchRoute';
}

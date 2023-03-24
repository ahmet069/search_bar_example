import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:search_bar_example/src/presentation/view/home_view.dart';
import 'package:search_bar_example/src/presentation/view/search_view.dart';
import 'package:search_bar_example/src/presentation/view/splash_view.dart';

part 'app_router.gr.dart';

/// `AppRouter` is a class that extends `_$AppRouter`
/// and is used to generate a `Router` object
@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      name: 'SplashRouter',
      page: SplashView,
      initial: true,
    ),
    AutoRoute(
      path: '/homeView',
      name: 'HomeRouter',
      page: HomeView,
    ),
    CustomRoute(
      page: SearchView,
      transitionsBuilder: TransitionsBuilders.slideLeftWithFade,
      durationInMilliseconds: 200,
    ),
  ],
)
class AppRouter extends _$AppRouter {}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_bar_example/src/config/app_router.dart';
import 'package:search_bar_example/src/data/repository/user_repositories.dart';
import 'package:search_bar_example/src/presentation/bloc/user/user_bloc.dart';

void main() {
  runApp(const MyApp());
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(UserRepository()),
      child: ScreenUtilInit(
        minTextAdapt: true,
        builder: (context, _) {
          return MaterialApp.router(
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

    // return ScreenUtilInit(
    //   minTextAdapt: true,
    //   builder: (context, _) {
    //     return MaterialApp.router(
    //       routerDelegate: router.delegate(),
    //       routeInformationParser: router.defaultRouteParser(),
    //       debugShowCheckedModeBanner: false,
    //     );
    //   },
    // );
// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:search_bar_example/src/config/app_router.dart';
import 'package:search_bar_example/src/data/repository/user_repositories.dart';
import 'package:search_bar_example/src/presentation/bloc/user/user_bloc.dart';
import 'dart:developer' as devtools show log;

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: PostBlocObserver(),
  );
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

class PostBlocObserver extends BlocObserver {
  // todo add not
  @override
  void onTransition(Bloc bloc, Transition transition) {
    'Bloc:$bloc'.log();
    super.onTransition(bloc, transition);
  }

  //* run when post bloc created
  @override
  void onCreate(BlocBase bloc) {
    'Post Bloc Created'.log();
    super.onCreate(bloc);
  }
}

//* just for console log events
extension Log on Object {
  void log() => devtools.log(toString());
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:search_bar_example/main.dart';
import 'package:search_bar_example/src/config/app_router.dart';
import 'package:search_bar_example/src/core/constants/svg_constants.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  void _gotoHome() {
    Timer(
      Duration(milliseconds: 1000),
      () {
        router.replace(HomeRouter());
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _gotoHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        top: false,
        child: Center(
          child: Container(
            color: Colors.black,
            alignment: Alignment.center,
            child: SvgPicture.asset(
              SVGConstants.logo,
              color: Colors.blue,
              width: 100,
              height: 100,
            ),
          ),
        ),
      ),
    );
  }
}

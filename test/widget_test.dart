import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final dio = Dio();
  expect(find.text('2'), () {
    print('kodzilla');
  });
}

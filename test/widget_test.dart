import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

final dio = Dio();
void main() {
  expect(find.text('2'), () {
    print('kodzilla');
  });
}

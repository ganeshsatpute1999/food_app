import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://api.spoonacular.com',
          headers: {'Content-Type': 'application/json'},
        ));

  Dio getDio() {
    return dio;
  }
}

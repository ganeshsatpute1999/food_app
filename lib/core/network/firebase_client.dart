import 'package:dio/dio.dart';

class FirebaseClient {
  final Dio dio;

  FirebaseClient()
      : dio = Dio(BaseOptions(
          baseUrl: 'https://foodapp-2749a-default-rtdb.firebaseio.com/',
          headers: {'Content-Type': 'application/json'},
        ));

  Dio getDio() {
    return dio;
  }
}

import 'package:dio/dio.dart';

class DioServices {
  static Dio dio = Dio(
    BaseOptions(
      sendTimeout: 5000,
      connectTimeout: 5000,
      receiveTimeout: 5000,
      responseType: ResponseType.plain,
    ),
  );
}

import 'package:dio/dio.dart';

class DioClient {
  static final dio = Dio(BaseOptions(
    receiveDataWhenStatusError: true,
    baseUrl: 'https://localhost:7010/',
    connectTimeout: const Duration(seconds: 5),
  ));
}

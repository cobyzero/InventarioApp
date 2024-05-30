import 'package:dio/dio.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<Response<dynamic>> login(String username, String password) async {
    try {
      final response = await dio.get(
        "api/login",
        queryParameters: {"username": username, "password": password},
      );

      return response;
    } catch (e) {
      throw Exception("Error al iniciar Sesion");
    }
  }
}

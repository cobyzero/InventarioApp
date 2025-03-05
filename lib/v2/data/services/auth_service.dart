import 'package:dio/dio.dart';
import 'package:inventarioapp/v2/dependency_injection/injector.dart';
import 'package:inventarioapp/v2/domain/entities/responses/login_response.dart';

class AuthService {
  final dio = getIt<Dio>();

  Future<String> login(String email, String password) async {
    try {
      var body = {
        "username": email,
        "password": password,
      };

      var response = await dio.post(
        "/auth/login",
        data: body,
      );

      final model = LoginResponse.fromJson(response.data);

      if (!model.success) {
        throw model.message;
      }

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}

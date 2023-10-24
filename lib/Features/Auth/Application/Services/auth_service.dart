import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<UserCredential> login(String username, String password) async {
    try {
      final response = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: username, password: password);

      if (response.user == null) {
        throw Exception();
      }

      return response;
    } catch (e) {
      throw Exception("Error al iniciar Sesion");
    }
  }
}

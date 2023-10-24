import 'dart:convert';

import 'package:dio/dio.dart';

class UserServices {
  final Dio dio;

  UserServices(this.dio);

  Future<Response<dynamic>> getUser(String uid) async {
    try {
      final response = await dio.get("/User", data: {
        "uid": uid,
      });

      if (response.statusCode != 200) {
        throw Exception();
      }

      return response;
    } catch (e) {
      throw "Error al obtener usuario";
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';
import 'package:inventarioapp/ViewModels/API.dart';
import 'package:http/http.dart' as http;

class AuthController extends GetxController {
  var username = TextEditingController();
  var password = TextEditingController();
  late UsuariosModel userModel;

  Future<void> login() async {
    Uri uri = API.getUri(
      path: "api/login",
      parameters: {
        "username": username.text,
        "password": password.text,
      },
    );

    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      Get.back();
      return;
    }

    userModel = UsuariosModel.fromJson(
      jsonDecode(response.body),
    );
    Get.toNamed("/main");
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';
import 'package:inventarioapp/Views/mainPage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  LoginController({required this.username, required this.password}) {}

  String username;
  String password;

  getLoginRequest(BuildContext context) async {
    UsuariosModel response = await requestGetLogin(
        path: "api/login", parameters: {"username": username, "password": password});

    if (response.IdUsuario == 0) {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Datos Invalido"),
            content: Text("Los datos ingresados fueron invalidos, vuelva a intentar"),
          );
        },
      );
      return;
    }

    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "/main", arguments: response);
  }

  static Future<dynamic> requestGetLogin(
      {required String path, required Map<String, dynamic> parameters}) async {
    var uri = API.getUri(path: path, parameters: parameters);

    http.Response response = await http.get(uri);

    if (response.body == "") {
      return UsuariosModel(0, "0", "0", "0", 0);
    }

    Map<String, dynamic> json = jsonDecode(response.body);

    return UsuariosModel.fromJson(json);
  }
}

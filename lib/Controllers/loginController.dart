import 'package:flutter/material.dart';
import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/LocalData/localData.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';
import 'package:inventarioapp/Views/mainPage.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginController {
  static Future<void> getLoginRequest(
      BuildContext context, String username, String password) async {
    Uri uri =
        API.getUri(path: "api/login", parameters: {"username": username, "password": password});

    http.Response response = await http.get(uri).whenComplete(() => Navigator.pop(context));

    UsuariosModel usuariosModel = UsuariosModel.fromJson(jsonDecode(response.body));

    if (usuariosModel.idUsuario == 0) {
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
    LocalData.userLocal = usuariosModel;
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, "/main");
  }
}

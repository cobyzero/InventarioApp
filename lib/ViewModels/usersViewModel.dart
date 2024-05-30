import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inventarioapp/Services/loginService.dart';
import 'package:inventarioapp/UserData/UserData.dart';
import 'package:inventarioapp/ViewModels/API.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';
import 'package:http/http.dart' as http;

class ListUsersViewModel {
  List<UsersViewModel>? list;

  Future<void> getUserForUsernamePassword(BuildContext context, username, String password) async {
    Uri uri =
        API.getUri(path: "api/login", parameters: {"username": username, "password": password});

    http.Response response = await http.get(uri);
    if (response.statusCode != 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      return;
    }

    list = [UsersViewModel(UsuariosModel.fromJson(jsonDecode(response.body)))];

    // ignore: use_build_context_synchronously
    LoginService loginService = LoginService(list![0].usuariosModel, context);
    loginService.initService();
  }
}

class UsersViewModel {
  UsuariosModel usuariosModel;

  UsersViewModel(this.usuariosModel);
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/v1/Models/usuariosModel.dart';
import 'package:inventarioapp/v1/UserData/UserData.dart';

class LoginService {
  UsuariosModel usuariosModel;
  BuildContext context;

  LoginService(this.usuariosModel, this.context);

  void initService() {
    setUserData();
    pushView();
  }

  void setUserData() {
    UserData.usuariosModel = usuariosModel;
  }

  void pushView() {
    Navigator.pop(context);
    Navigator.pushNamed(context, "main");
  }
}

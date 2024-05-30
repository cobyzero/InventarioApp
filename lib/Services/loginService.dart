import 'package:flutter/material.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';
import 'package:inventarioapp/UserData/UserData.dart';

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

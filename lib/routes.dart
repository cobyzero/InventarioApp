import 'package:flutter/material.dart';
import 'package:inventarioapp/v1/Views/Login/loginView.dart';
import 'package:inventarioapp/v1/Views/Main/mainPage.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "login": (context) => const LoginView(),
    "main": (context) => MainView(),
  };
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/Views/Login/loginView.dart';
import 'package:inventarioapp/Views/Main/mainPage.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "login": (context) => const LoginView(),
    "main": (context) => MainView(),
  };
}

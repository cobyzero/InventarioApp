import 'package:flutter/material.dart';
import 'package:inventarioapp/Views/loginPage.dart';
import 'package:inventarioapp/Views/mainPage.dart';

Map<String, WidgetBuilder> routesApp() {
  return {
    "/login": (context) => LoginPage(),
    "/main": (context) => MainPage(),
  };
}

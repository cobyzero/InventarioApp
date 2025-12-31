import 'package:flutter/material.dart';
import 'package:inventarioapp/v1/Views/Login/Widgets/loginContainerLeft.dart';
import 'package:inventarioapp/v1/Views/Login/Widgets/loginContainerRight.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Row(
        children: [
          LoginContainerLeft(),
          const LoginContainerRight(),
        ],
      ),
    ));
  }
}

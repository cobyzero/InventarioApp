import 'package:flutter/material.dart';
import 'package:inventarioapp/Features/Auth/Infraestructure/Presentation/Widgets/loginContainerLeft.dart';
import 'package:inventarioapp/Features/Auth/Infraestructure/Presentation/Widgets/loginContainerRight.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/Controllers/loginController.dart';
import 'package:inventarioapp/Views/mainPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var email = TextEditingController();
  var password = TextEditingController();
  @override
  void initState() {
    API.checkServer(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Row(
        children: [left(), Right()],
      ),
    ));
  }

  Expanded left() {
    return Expanded(
        child: Container(
      padding: const EdgeInsets.all(50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.flutter_dash,
                size: 60,
              ),
              const Text(
                "Iniciar Sesion",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              space(h: 40),
              MyTextFormField(
                controller: email,
                text: "Usuario*",
              ),
              space(h: 30),
              MyTextFormField(
                controller: password,
                text: "Contraseña*",
              ),
              space(
                h: 40,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.only(
                        left: 118,
                        right: 118,
                        top: 17,
                        bottom: 17,
                      )),
                  onPressed: () async {
                    cargando(context);
                    await LoginController.getLoginRequest(context, email.text, password.text);
                  },
                  child: FadeIn(
                    duration: const Duration(seconds: 3),
                    child: const Text("Ingresar"),
                  ))
            ],
          ),
        ],
      ),
    ));
  }

  Expanded Right() {
    return Expanded(
        child: Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(50),
      color: const Color(0xff1E293B),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sistema Inventario App",
                style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
              ),
              space(h: 10),
              const Text(
                "Si deseas apoyarme con un follow en github estare agradecido :3 ",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              const Text(
                "Codigo Fuente en: https://github.com/cobyzero",
                style: TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/ViewModels/usersViewModel.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';

// ignore: must_be_immutable
class LoginContainerLeft extends StatelessWidget {
  LoginContainerLeft({super.key});
  var email = TextEditingController();
  var password = TextEditingController();
  ListUsersViewModel listUsersViewModel = ListUsersViewModel();
  @override
  Widget build(BuildContext context) {
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
                    await listUsersViewModel.getUserForUsernamePassword(
                        context, email.text, password.text);
                  },
                  child: const Text("Ingresar"))
            ],
          ),
        ],
      ),
    ));
  }
}

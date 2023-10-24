import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Features/Auth/Application/Bloc/login_bloc/login_bloc.dart';
import 'package:inventarioapp/Features/User/Application/Blocs/user_bloc/user_bloc.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';

class LoginContainerLeft extends StatelessWidget {
  LoginContainerLeft({
    super.key,
  });
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginBloc, LoginState>(
          listener: (context, state) async {
            if (state is LoginAuthenticate) {
              Navigator.pop(context);
              await successAlertMessage(context, "Ingreso correctamente").whenComplete(
                () => context
                    .read<UserBloc>()
                    .add(UserEventLoadedUser(FirebaseAuth.instance.currentUser!.uid)),
              );
            }
            if (state is LoginError) {
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
              // ignore: use_build_context_synchronously
              errorAlertMessage(context, state.error);
            }
          },
        ),
        BlocListener<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserComplete) {
              context.go("/main");
            }
          },
        ),
      ],
      child: Expanded(
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
                  controller: emailController,
                  text: "Usuario*",
                ),
                space(h: 30),
                MyTextFormField(
                  controller: passwordController,
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

                    context.read<LoginBloc>().add(
                          LoginEventLoginIn(emailController.text, passwordController.text),
                        );
                  },
                  child: const Text("Ingresar"),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}

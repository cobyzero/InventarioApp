import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Core/Utils/utils.dart';
import 'package:inventarioapp/Features/Auth/Application/bloc/auth_bloc.dart';
import 'package:inventarioapp/Features/Auth/Presentation/Widgets/loginContainerRight.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthResult) {
            context.go('/home');
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return Row(
            children: [
              Expanded(
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
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
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
                                context.read<AuthBloc>().add(
                                      LoginEvent(
                                        emailController.text,
                                        passwordController.text,
                                      ),
                                    );
                              },
                              child: const Text("Ingresar"))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const LoginContainerRight(),
            ],
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/core/util/palette.dart';
import 'package:inventarioapp/core/util/texts.dart';
import 'package:inventarioapp/core/widgets/custom_button.dart';
import 'package:inventarioapp/features/auth/controllers/auth_controller.dart';
import 'package:sizer/sizer.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.flutter_dash,
                          size: 60,
                        ),
                        Texts.bold(
                          "Iniciar Sesion",
                          fontSize: 16,
                        ),
                      ],
                    ),
                  ).marginOnly(bottom: 3.h),
                  MyTextFormField(
                    controller: controller.username,
                    text: "Usuario",
                  ).marginOnly(bottom: 2.h),
                  MyTextFormField(
                    controller: controller.password,
                    text: "Contraseña",
                    obscureText: true,
                  ).marginOnly(bottom: 2.h),
                  CustomButton(
                    text: "Ingresar",
                    onPressed: () async {
                      cargando(context);
                      await controller.login();
                    },
                  ),
                ],
              ).paddingSymmetric(horizontal: 20.w),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                color: Palette.kPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Texts.bold(
                      "Sistema Inventario App",
                      fontSize: 17,
                      color: Palette.white,
                    ).marginOnly(bottom: 2.h),
                    const Texts.regular(
                      "Si deseas apoyarme con un follow en github estare agradecido.",
                      color: Palette.greyBlack,
                      fontSize: 6,
                    ).marginOnly(bottom: 1.h),
                    const Texts.regular(
                      "Codigo Fuente en: https://github.com/cobyzero",
                      color: Palette.greyBlack,
                      fontSize: 6,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

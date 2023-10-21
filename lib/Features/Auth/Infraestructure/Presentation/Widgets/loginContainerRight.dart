import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';

class LoginContainerRight extends StatelessWidget {
  const LoginContainerRight({super.key});

  @override
  Widget build(BuildContext context) {
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

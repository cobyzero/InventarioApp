import 'package:flutter/material.dart';

class BotonBase extends StatelessWidget {
  BotonBase({super.key, required this.icon, required this.texto, this.w = 160, this.fun});

  IconData icon;
  String texto;
  double w;
  Function()? fun;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(icon),
        style: ElevatedButton.styleFrom(fixedSize: Size(w, 40)),
        onPressed: fun,
        label: Text(texto));
  }
}

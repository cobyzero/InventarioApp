import 'package:flutter/material.dart';

class BotonMenu extends StatelessWidget {
  BotonMenu({
    super.key,
    required this.texto,
    required this.icon,
    required this.fun,
  });

  String texto;
  IconData icon;
  Function() fun;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: fun,
      icon: Icon(icon),
      label: Text(texto),
      style: ElevatedButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: Colors.grey,
          shadowColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          fixedSize: Size(220, 50)),
    );
  }
}

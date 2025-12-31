import 'package:flutter/material.dart';

class MiniBotonMenu extends StatelessWidget {
  MiniBotonMenu({
    super.key,
    required this.icon,
    required this.fun,
  });

  IconData icon;
  Function() fun;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: fun,
        icon: Icon(
          icon,
          color: Colors.grey,
        ));
  }
}

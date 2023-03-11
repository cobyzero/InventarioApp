import 'package:flutter/material.dart';

class BaseVentana extends StatelessWidget {
  BaseVentana({super.key, required this.fun});
  Widget fun;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: fun,
    );
  }
}

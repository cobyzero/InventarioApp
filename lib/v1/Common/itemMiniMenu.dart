import 'package:flutter/material.dart';

class MiniMenuBase extends StatelessWidget {
  MiniMenuBase(
      {super.key, required this.color, required this.icon, required this.texto, required this.fun});
  IconData icon;
  String texto;
  Color color;
  Function() fun;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: fun,
      child: Container(
        height: 100,
        width: 100,
        margin: const EdgeInsets.only(left: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
            ),
            Text(
              texto,
              style: TextStyle(color: color),
            )
          ],
        ),
      ),
    );
  }
}

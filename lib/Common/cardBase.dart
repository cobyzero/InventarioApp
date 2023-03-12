import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';

class CardBase extends StatelessWidget {
  CardBase({super.key, required this.texto, required this.cantidad, required this.color});

  String texto;
  String cantidad;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.only(left: 20),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 10, top: 10, bottom: 30),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  texto,
                  style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
                ),
                space(w: 180),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.grey[700],
                    ))
              ],
            ),
            Column(
              children: [
                Text(
                  cantidad,
                  style: TextStyle(fontSize: 70, color: color, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Common/common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardBase(
                  cantidad: 25,
                  color: Colors.cyan,
                  confirmadas: 7,
                  texto: "Entradas",
                ),
                CardBase(
                  cantidad: 21,
                  color: Colors.red,
                  confirmadas: 7,
                  texto: "Salidas",
                ),
                CardBase(
                  cantidad: 15,
                  color: Colors.yellow,
                  confirmadas: 7,
                  texto: "Almacen",
                ),
                CardBase(
                  cantidad: 7,
                  color: Colors.green,
                  confirmadas: 7,
                  texto: "Tecnicos",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

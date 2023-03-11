import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/GraficoBase.dart';

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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardsDatos(),
            space(h: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [space(w: 20), GraficosBase(), GraficosBase2()],
              ),
            )
          ],
        ),
      ),
    );
  }

  SingleChildScrollView cardsDatos() {
    return SingleChildScrollView(
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
    );
  }
}

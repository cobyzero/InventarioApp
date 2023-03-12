import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/GraficoBase.dart';
import 'package:inventarioapp/Controllers/mainController.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
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
        child: FutureBuilder(
          future: MainController.getResquestEntradasCount(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  CardBase(
                    cantidad: snapshot.data![0],
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: snapshot.data![1],
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: snapshot.data![2],
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: snapshot.data![3],
                    color: Colors.green,
                    texto: "Tecnicos",
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  CardBase(
                    cantidad: "0",
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.green,
                    texto: "Tecnicos",
                  ),
                ],
              );
            }
          },
        ));
  }
}

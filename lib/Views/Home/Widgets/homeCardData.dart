import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Services/mainService.dart';

class HomeCardData extends StatelessWidget {
  const HomeCardData({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: MainService.getResquestEntradasCount(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  CardBase(
                    cantidad: snapshot.data!["Entradas"]!,
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: snapshot.data!["Salidas"]!,
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: snapshot.data!["Productos"]!,
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: snapshot.data!["Usuarios"]!,
                    color: Colors.green,
                    texto: "Usuarios",
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  CardBase(
                    cantidad: 0,
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: 0,
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: 0,
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: 0,
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

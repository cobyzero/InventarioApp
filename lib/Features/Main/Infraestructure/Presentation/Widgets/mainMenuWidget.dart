import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/itemMiniMenu.dart';

class MainMenuWidget {
  BuildContext context;
  PageController controller;
  MainMenuWidget(this.context, this.controller);

  void menuProductos() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Row(
          children: [
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.search,
              texto: "Detalle",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(7);
              },
            ),
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.list,
              texto: "Cargar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(8);
              },
            ),
          ],
        ));
      },
    );
  }

  void menuSalida() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Row(
          children: [
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.add,
              texto: "Agregar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(1);
              },
            ),
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.search,
              texto: "Buscar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(2);
              },
            ),
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.list,
              texto: "Listar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(3);
              },
            ),
          ],
        ));
      },
    );
  }

  void menuEntrada() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: Row(
          children: [
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.add,
              texto: "Agregar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(4);
              },
            ),
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.search,
              texto: "Buscar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(5);
              },
            ),
            MiniMenuBase(
              color: Colors.black,
              icon: Icons.list,
              texto: "Listar",
              fun: () {
                Navigator.pop(context);
                controller.jumpToPage(6);
              },
            ),
          ],
        ));
      },
    );
  }
}

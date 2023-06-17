import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonMenu.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Models/permisosModel.dart';
import 'package:inventarioapp/Providers/providerMain.dart';
import 'package:inventarioapp/Views/Main/Widgets/mainMenuWidget.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainMenuOpen extends StatelessWidget {
  PageController controller;
  PermisosModel permisosModel;
  MainMenuWidget mainMenuWidget;
  late ProviderMain providerMain;

  MainMenuOpen(
      {super.key,
      required this.controller,
      required this.mainMenuWidget,
      required this.permisosModel});
  @override
  Widget build(BuildContext context) {
    providerMain = Provider.of<ProviderMain>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    providerMain.activeView = false;
                  },
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: 30,
                  )),
            ],
          ),
          space(h: 30),
          BotonMenu(
            fun: () {
              controller.jumpToPage(0);
            },
            texto: "Home",
            icon: Icons.home,
          ),
          space(h: 10),
          /**
           * Salidas
           */
          if (permisosModel.salidas == 1)
            BotonMenu(
              fun: () {
                mainMenuWidget.menuSalida();
              },
              texto: "Salidas",
              icon: Icons.unarchive,
            ),
          space(h: 10),
          /**
           * Entradas
           */
          if (permisosModel.entradas == 1)
            BotonMenu(
              fun: () {
                mainMenuWidget.menuEntrada();
              },
              texto: "Entradas",
              icon: Icons.archive,
            ),
          space(h: 10),
          /**
           * Productos
           */
          if (permisosModel.productos == 1)
            BotonMenu(
              fun: () {
                mainMenuWidget.menuProductos();
              },
              texto: "Productos",
              icon: Icons.widgets,
            ),
          space(h: 10),

          /**
           * Tecnicos
           */
          if (permisosModel.configuracion == 1)
            BotonMenu(
              fun: () {
                controller.jumpToPage(9);
              },
              texto: "Usuarios",
              icon: Icons.groups,
            ),
          space(h: 10),
          /**
           * Proveedores
           */
          if (permisosModel.proveedores == 1)
            BotonMenu(
              fun: () {
                controller.jumpToPage(10);
              },
              texto: "Proveedores",
              icon: Icons.local_shipping,
            ),
          space(h: 10),
          /**
           * Inventario
           */
          if (permisosModel.inventario == 1)
            BotonMenu(
              fun: () {
                controller.jumpToPage(11);
              },
              texto: "Inventario",
              icon: Icons.inventory_2,
            ),
          space(h: 10),
          if (permisosModel.configuracion == 1)
            BotonMenu(
              fun: () {
                controller.jumpToPage(12);
              },
              texto: "Configuracion",
              icon: Icons.settings,
            ),
        ],
      ),
    );
  }
}

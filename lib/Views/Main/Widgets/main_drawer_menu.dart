import 'package:flutter/material.dart';
import 'package:inventarioapp/features/main/widgets/botonMenu.dart'; 

class MainDrawerMenu extends StatelessWidget {
  const MainDrawerMenu({
    super.key,
    required this.controller, 
    required this.isDrawerOpen,
    required this.indexPage,
  });

  final PageController controller; 
  final bool isDrawerOpen;
  final int indexPage;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return BotonMenuItem(
          text: list[index].text,
          icon: list[index].icon,
          onTap: () => controller.jumpToPage(index),
          isOpen: isDrawerOpen,
          isSelected: indexPage == index,
        );
      },
    );
  }

  static final list = <BottonMenuModel>[
    BottonMenuModel("Inicio", Icons.home),
    BottonMenuModel("Salidas", Icons.unarchive),
    BottonMenuModel("Entradas", Icons.archive),
    BottonMenuModel("Productos", Icons.widgets),
    BottonMenuModel("Usuarios", Icons.groups),
    BottonMenuModel("Proveedores", Icons.local_shipping),
    BottonMenuModel("Inventario", Icons.inventory_2),
    BottonMenuModel("Configuracion", Icons.settings),
    BottonMenuModel("Cerrar Sesion", Icons.logout),
  ];
}

class BottonMenuModel {
  final String text;
  final IconData icon;

  BottonMenuModel(this.text, this.icon);
}

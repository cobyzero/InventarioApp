import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/miniBotonMenu.dart';
import 'package:inventarioapp/Core/Const/enums.dart';
import 'package:inventarioapp/Features/Main/Application/Blocs/main_bloc/main_bloc.dart';
import 'package:inventarioapp/Features/Main/Infraestructure/Presentation/Widgets/mainMenuWidget.dart';
import 'package:inventarioapp/Models/permisosModel.dart';

// ignore: must_be_immutable
class MainMenuClose extends StatelessWidget {
  PageController controller;
  PermisosModel permisosModel;
  MainMenuWidget mainMenuWidget;
  MainMenuClose(
      {super.key,
      required this.controller,
      required this.mainMenuWidget,
      required this.permisosModel});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                context.read<MainBloc>().add(
                      MainEventModifyMenuStatus(MainMenuStatus.open),
                    );
              },
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              )),
          space(h: 30),
          MiniBotonMenu(
            fun: () {
              controller.jumpToPage(0);
            },
            icon: Icons.home,
          ),
          space(h: 10),
          if (permisosModel.salidas == 1)
            MiniBotonMenu(
              fun: () {
                mainMenuWidget.menuSalida();
              },
              icon: Icons.unarchive,
            ),
          space(h: 10),
          if (permisosModel.entradas == 1)
            MiniBotonMenu(
              fun: () {
                mainMenuWidget.menuEntrada();
              },
              icon: Icons.archive,
            ),
          space(h: 10),
          if (permisosModel.productos == 1)
            MiniBotonMenu(
              fun: () {
                mainMenuWidget.menuProductos();
              },
              icon: Icons.widgets,
            ),
          space(h: 10),
          if (permisosModel.configuracion == 1)
            MiniBotonMenu(
              fun: () {
                controller.jumpToPage(12);
              },
              icon: Icons.groups,
            ),
          space(h: 10),
          if (permisosModel.proveedores == 1)
            MiniBotonMenu(
              fun: () {
                controller.jumpToPage(13);
              },
              icon: Icons.local_shipping,
            ),
          space(h: 10),
          if (permisosModel.inventario == 1)
            MiniBotonMenu(
              fun: () {
                controller.jumpToPage(14);
              },
              icon: Icons.inventory_2,
            ),
          space(h: 10),
          if (permisosModel.configuracion == 1)
            MiniBotonMenu(
              fun: () {
                controller.jumpToPage(15);
              },
              icon: Icons.settings,
            ),
        ],
      ),
    );
  }
}

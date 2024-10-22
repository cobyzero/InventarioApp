import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonMenu.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Core/Utils/utils.dart';
import 'package:inventarioapp/Features/Main/Application/bloc/main_bloc.dart';

class MainModules extends StatelessWidget {
  final PageController controller;
  const MainModules({
    super.key,
    required this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is MainLoaded) {
          return SingleChildScrollView(
            child: Column(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 30,
                    )),
                space(h: 30),
                BotonMenu(
                  texto: "Inicio",
                  fun: () {
                    controller.jumpToPage(0);
                  },
                  icon: Icons.home,
                ),
                space(h: 10),
                if (state.modulesEntity.salidas)
                  BotonMenu(
                    texto: "Salidas",
                    fun: () {},
                    icon: Icons.unarchive,
                  ),
                space(h: 10),
                if (state.modulesEntity.entradas)
                  BotonMenu(
                    texto: "Entradas",
                    fun: () {},
                    icon: Icons.archive,
                  ),
                space(h: 10),
                if (state.modulesEntity.productos)
                  BotonMenu(
                    texto: "Productos",
                    fun: () {},
                    icon: Icons.widgets,
                  ),
                space(h: 10),
                if (state.modulesEntity.proveedores)
                  BotonMenu(
                    texto: "Proveedores",
                    fun: () {
                      controller.jumpToPage(12);
                    },
                    icon: Icons.groups,
                  ),
                space(h: 10),
                if (state.modulesEntity.inventario)
                  BotonMenu(
                    texto: "Inventario",
                    fun: () {
                      controller.jumpToPage(13);
                    },
                    icon: Icons.local_shipping,
                  ),
                space(h: 10),
                if (state.modulesEntity.inventario)
                  BotonMenu(
                    texto: "Inventario",
                    fun: () {
                      controller.jumpToPage(14);
                    },
                    icon: Icons.inventory_2,
                  ),
                space(h: 10),
                if (state.modulesEntity.configuracion)
                  BotonMenu(
                    texto: "Configuración",
                    fun: () {
                      controller.jumpToPage(15);
                    },
                    icon: Icons.settings,
                  ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}

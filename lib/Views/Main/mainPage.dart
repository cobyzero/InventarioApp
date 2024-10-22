import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Models/permisosModel.dart';
import 'package:inventarioapp/Services/mainService.dart';
import 'package:inventarioapp/UserData/UserData.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Views/Clients/clientsView.dart';
import 'package:inventarioapp/Views/Entradas/buscarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/listarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/registrarEntrada.dart';
import 'package:inventarioapp/Views/Home/homePage.dart';
import 'package:inventarioapp/Views/Inventory/inventoryView.dart';
import 'package:inventarioapp/Views/Main/Widgets/mainMenuClose.dart';
import 'package:inventarioapp/Views/Main/Widgets/mainMenuWidget.dart';
import 'package:inventarioapp/Views/Productos/cargarProducto.dart';
import 'package:inventarioapp/Views/Productos/detalleProducto.dart';
import 'package:inventarioapp/Views/Proveedores/proveedoresView.dart';
import 'package:inventarioapp/Views/Salidas/buscarSalida.dart';
import 'package:inventarioapp/Views/Salidas/listarSalida.dart';
import 'package:inventarioapp/Views/Salidas/registrarSalida.dart';
import 'package:inventarioapp/Views/Settings/settingsView.dart';

// ignore: must_be_immutable
class MainView extends StatelessWidget {
  MainView({super.key});

  var controller = PageController();
  late PermisosModel permisosModel;
  late MainMenuWidget mainMenuWidget;

  @override
  Widget build(BuildContext context) {
    mainMenuWidget = MainMenuWidget(context, controller);
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              width: 260,
              color: const Color(0xff111827),
              child: FutureBuilder(
                future: MainService.getPermisos(
                    UserData.usuariosModel!.idPermisos!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    permisosModel = snapshot.data!;
                    return MainMenuClose(
                      controller: controller,
                      permisosModel: permisosModel,
                      mainMenuWidget: mainMenuWidget,
                    );
                  } else {
                    return Container();
                  }
                },
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  width: double.infinity,
                  height: 70,
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                    ),
                  ]),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          "Bienvenido denuevo, ${UserData.usuariosModel!.nombreCompleto}!",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 26),
                        ),
                      ],
                    ),
                  ),
                ),
                space(h: 30),
                Expanded(child: pageViewList())
              ],
            ),
          )
        ],
      ),
    );
  }

  PageView pageViewList() {
    return PageView(
      controller: controller,
      children: [
        HomePage(),
        RegistrarSalidaPage(),
        BuscarSalidaPage(),
        ListarSalidaPage(),
        RegistrarEntradaPage(),
        BuscarEntradaPage(),
        ListarEntradaPage(),
        DetalleProducto(),
        CargarProductoPage(),
        ClientsView(),
        ProveedoresView(),
        InventoryView(),
        SettingsView()
      ],
    );
  }
}

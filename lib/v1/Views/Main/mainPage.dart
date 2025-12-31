import 'package:flutter/material.dart';
import 'package:inventarioapp/v1/Common/common.dart';
import 'package:inventarioapp/v1/Providers/providerMain.dart';
import 'package:inventarioapp/v1/UserData/UserData.dart';
import 'package:inventarioapp/v1/Util/colors.dart';
import 'package:inventarioapp/v1/Services/mainService.dart';
import 'package:inventarioapp/v1/Models/permisosModel.dart';
import 'package:inventarioapp/v1/Views/Entradas/buscarEntrada.dart';
import 'package:inventarioapp/v1/Views/Entradas/listarEntrada.dart';
import 'package:inventarioapp/v1/Views/Entradas/registrarEntrada.dart';
import 'package:inventarioapp/v1/Views/Main/Widgets/mainMenuWidget.dart';
import 'package:inventarioapp/v1/Views/Main/Widgets/mainMenuClose.dart';
import 'package:inventarioapp/v1/Views/Main/Widgets/mainMenuOpen.dart';
import 'package:inventarioapp/v1/Views/Productos/cargarProducto.dart';
import 'package:inventarioapp/v1/Views/Productos/detalleProducto.dart';
import 'package:inventarioapp/v1/Views/Salidas/buscarSalida.dart';
import 'package:inventarioapp/v1/Views/Salidas/listarSalida.dart';
import 'package:inventarioapp/v1/Views/Settings/settingsView.dart';
import 'package:inventarioapp/v1/Views/Home/homePage.dart';
import 'package:inventarioapp/v1/Views/Salidas/registrarSalida.dart';
import 'package:inventarioapp/v1/Views/Inventory/inventoryView.dart';
import 'package:inventarioapp/v1/Views/Proveedores/proveedoresView.dart';
import 'package:inventarioapp/v1/Views/Clients/clientsView.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MainView extends StatelessWidget {
  MainView({super.key});

  var controller = PageController();
  late PermisosModel permisosModel;
  late MainMenuWidget mainMenuWidget;
  late ProviderMain providerMain;

  @override
  Widget build(BuildContext context) {
    providerMain = Provider.of<ProviderMain>(context);

    mainMenuWidget = MainMenuWidget(context, controller);
    return Scaffold(
      backgroundColor: bgColor,
      body: Row(
        children: [
          Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              width: providerMain.activeView ? 260 : 80,
              color: const Color(0xff111827),
              child: FutureBuilder(
                future: MainService.getPermisos(UserData.usuariosModel!.idPermisos!),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    permisosModel = snapshot.data!;
                    return providerMain.activeView
                        ? MainMenuOpen(
                            controller: controller,
                            permisosModel: permisosModel,
                            mainMenuWidget: mainMenuWidget,
                          )
                        : MainMenuClose(
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
                  decoration: const BoxDecoration(color: Colors.white, boxShadow: [
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
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
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

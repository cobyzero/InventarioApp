import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonMenu.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/miniBotonMenu.dart';
import 'package:inventarioapp/Common/itemMiniMenu.dart';
import 'package:inventarioapp/Controllers/mainController.dart';
import 'package:inventarioapp/LocalData/localData.dart';
import 'package:inventarioapp/Models/permisosModel.dart';
import 'package:inventarioapp/Views/Entradas/buscarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/listarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/registrarEntrada.dart';
import 'package:inventarioapp/Views/Productos/cargarProducto.dart';
import 'package:inventarioapp/Views/Productos/detalleProducto.dart';
import 'package:inventarioapp/Views/Salidas/buscarSalida.dart';
import 'package:inventarioapp/Views/Salidas/listarSalida.dart';
import 'package:inventarioapp/Views/configuracionPage.dart';
import 'package:inventarioapp/Views/homePage.dart';
import 'package:inventarioapp/Views/Salidas/registrarSalida.dart';
import 'package:inventarioapp/Views/inventarioPage.dart';
import 'package:inventarioapp/Views/proveedoresPage.dart';
import 'package:inventarioapp/Views/tecnicosPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PermisosModel permisosModel;
  bool active = false;
  var controller = PageController();
  bool listo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.message_outlined),
      ),
      backgroundColor: const Color(0xffF1F5F9),
      body: Row(
        children: [
          Container(
              height: double.infinity,
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              width: active ? 80 : 260,
              color: const Color(0xff111827),
              child: FutureBuilder(
                future: MainController.getPermisos(LocalData.userLocal!.IdPermisos),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    permisosModel = snapshot.data!;
                    return active ? MenuCerrado() : MenuAbierto();
                  } else {
                    return const Center(
                      child: SizedBox(
                        height: 40,
                        width: 40,
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                },
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
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
                          "Bienvenido denuevo, ${LocalData.userLocal!.NombreComplet}!",
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
      children: const [
        HomePage(),
        RegistrarSalidaPage(),
        BuscarSalidaPage(),
        ListarSalidaPage(),
        RegistrarEntradaPage(),
        BuscarEntradaPage(),
        ListarEntradaPage(),
        DetalleProducto(),
        CargarProductoPage(),
        TecnicosPage(),
        ProveedoresPage(),
        InventarioPage(),
        ConfiguracionPage()
      ],
    );
  }

  MenuAbierto() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                  onPressed: () {
                    LocalData.clearData();
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 30,
                  )),
              IconButton(
                  onPressed: () {
                    setState(() {
                      active = true;
                    });
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
                menuSalidas();
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
                menuEntradas();
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
                menuProductos();
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
              texto: "Tecnicos",
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

  Future<dynamic> menuProductos() {
    return showDialog(
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

  Future<dynamic> menuEntradas() {
    return showDialog(
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

  menuSalidas() {
    return showDialog(
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

  MenuCerrado() {
    return SingleChildScrollView(
      child: Column(
        children: [
          IconButton(
              onPressed: () {
                setState(() {
                  active = false;
                });
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
                menuSalidas();
              },
              icon: Icons.unarchive,
            ),
          space(h: 10),
          if (permisosModel.entradas == 1)
            MiniBotonMenu(
              fun: () {
                menuEntradas();
              },
              icon: Icons.archive,
            ),
          space(h: 10),
          if (permisosModel.productos == 1)
            MiniBotonMenu(
              fun: () {
                menuProductos();
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

import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonMenu.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/miniBotonMenu.dart';
import 'package:inventarioapp/Common/itemMiniMenu.dart';
import 'package:inventarioapp/Views/Entradas/buscarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/listarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/registrarEntrada.dart';
import 'package:inventarioapp/Views/Productos/cargarProducto.dart';
import 'package:inventarioapp/Views/Productos/detalleProducto.dart';
import 'package:inventarioapp/Views/Salidas/buscarSalida.dart';
import 'package:inventarioapp/Views/Salidas/listarSalida.dart';
import 'package:inventarioapp/Views/homePage.dart';
import 'package:inventarioapp/Views/Salidas/registrarSalida.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool active = true;
  var controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1F5F9),
      body: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
            width: active ? 80 : 260,
            color: const Color(0xff111827),
            child: active ? MenuCerrado() : MenuAbierto(),
          ),
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Bienvenido denuevo, Sebastian!",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.notifications,
                                color: Colors.grey,
                              ),
                              Text(
                                "Tienes 2 nuevos mensajes",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                space(h: 30),
                Expanded(
                    child: PageView(
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
                    CargarProductoPage()
                  ],
                ))
              ],
            ),
          )
        ],
      ),
    );
  }

  MenuAbierto() {
    return Column(
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
        BotonMenu(
          fun: () {
            menuProductos();
          },
          texto: "Productos",
          icon: Icons.widgets,
        ),
        space(h: 10),
        BotonMenu(
          fun: () {
            menuPedidos();
          },
          texto: "Pedidos",
          icon: Icons.import_contacts,
        ),
        space(h: 10),
        BotonMenu(
          fun: () {},
          texto: "Proveedores",
          icon: Icons.label_off_outlined,
        ),
        space(h: 10),
        BotonMenu(
          fun: () {},
          texto: "Configuracion",
          icon: Icons.javascript_outlined,
        ),
      ],
    );
  }

  Future<dynamic> menuPedidos() {
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

  Future<dynamic> menuSalidas() {
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

  Column MenuCerrado() {
    return Column(
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
          fun: () {},
          icon: Icons.home_outlined,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.lock_outline,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.offline_bolt_outlined,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.fiber_dvr_outlined,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.padding_outlined,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.label_off_outlined,
        ),
        space(h: 10),
        MiniBotonMenu(
          fun: () {},
          icon: Icons.javascript_outlined,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:inventarioapp/Common/botonMenu.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Core/Const/enums.dart';
import 'package:inventarioapp/Features/Auth/Application/Bloc/login_bloc/login_bloc.dart';
import 'package:inventarioapp/Features/Main/Application/Blocs/Main_bloc/main_bloc.dart';
import 'package:inventarioapp/Features/Main/Infraestructure/Presentation/Widgets/mainMenuWidget.dart';
import 'package:inventarioapp/Features/Main/Infraestructure/Presentation/Widgets/main_menu_item.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Services/mainService.dart';
import 'package:inventarioapp/Models/permisosModel.dart';
import 'package:inventarioapp/Views/Entradas/buscarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/listarEntrada.dart';
import 'package:inventarioapp/Views/Entradas/registrarEntrada.dart';
import 'package:inventarioapp/Views/Productos/cargarProducto.dart';
import 'package:inventarioapp/Views/Productos/detalleProducto.dart';
import 'package:inventarioapp/Views/Salidas/buscarSalida.dart';
import 'package:inventarioapp/Views/Salidas/listarSalida.dart';
import 'package:inventarioapp/Views/Settings/settingsView.dart';
import 'package:inventarioapp/Views/Home/homePage.dart';
import 'package:inventarioapp/Views/Salidas/registrarSalida.dart';
import 'package:inventarioapp/Views/Inventory/inventoryView.dart';
import 'package:inventarioapp/Views/Proveedores/proveedoresView.dart';
import 'package:inventarioapp/Views/Clients/clientsView.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final controller = PageController();
  // late PermisosModel permisosModel;
  // late MainMenuWidget mainMenuWidget;

  @override
  Widget build(BuildContext context) {
    // mainMenuWidget = MainMenuWidget(context, controller);
    final userState = context.read<LoginBloc>().state as LoginAuthenticate;

    return Scaffold(
      body: SliderDrawer(
        splashColor: Colors.black,
        appBar: SliderAppBar(title: Text("")),
        slider: Container(
          padding: EdgeInsets.only(top: 2.h),
          child: Column(
            children: [
              Text(
                "ALMACEN",
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              MainMenuItem(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  controller.jumpToPage(0);
                },
              ),
              MainMenuItem(
                title: "Salidas",
                icon: Icons.unarchive,
                onTap: () {
                  controller.jumpToPage(0);
                },
              ),
              MainMenuItem(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  controller.jumpToPage(0);
                },
              ),
              MainMenuItem(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  controller.jumpToPage(0);
                },
              ),
              MainMenuItem(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  controller.jumpToPage(0);
                },
              )
            ],
          ),
        ),
        child: Container(
          color: Colors.white,
        ),
      ),
    );
  }
}

                              //                     space(h: 30),
                              //                     BotonMenu(
                              //                       fun: () {
                              //                         controller.jumpToPage(0);
                              //                       },
                              //                       texto: "Home",
                              //                       icon: Icons.home,
                              //                     ),
                              //                     space(h: 10),
                              //                     /**
                              //  * Salidas
                              //  */
                              //                     if (permisosModel.salidas == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           mainMenuWidget.menuSalida();
                              //                         },
                              //                         texto: "Salidas",
                              //                         icon: Icons.unarchive,
                              //                       ),
                              //                     space(h: 10),
                              //                     /**
                              //  * Entradas
                              //  */
                              //                     if (permisosModel.entradas == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           mainMenuWidget.menuEntrada();
                              //                         },
                              //                         texto: "Entradas",
                              //                         icon: Icons.archive,
                              //                       ),
                              //                     space(h: 10),
                              //                     /**
                              //  * Productos
                              //  */
                              //                     if (permisosModel.productos == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           mainMenuWidget.menuProductos();
                              //                         },
                              //                         texto: "Productos",
                              //                         icon: Icons.widgets,
                              //                       ),
                              //                     space(h: 10),

                              //                     /**
                              //  * Tecnicos
                              //  */
                              //                     if (permisosModel.configuracion == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           controller.jumpToPage(9);
                              //                         },
                              //                         texto: "Usuarios",
                              //                         icon: Icons.groups,
                              //                       ),
                              //                     space(h: 10),
                              //                     /**
                              //  * Proveedores
                              //  */
                              //                     if (permisosModel.proveedores == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           controller.jumpToPage(10);
                              //                         },
                              //                         texto: "Proveedores",
                              //                         icon: Icons.local_shipping,
                              //                       ),
                              //                     space(h: 10),
                              //                     /**
                              //  * Inventario
                              //  */
                              //                     if (permisosModel.inventario == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           controller.jumpToPage(11);
                              //                         },
                              //                         texto: "Inventario",
                              //                         icon: Icons.inventory_2,
                              //                       ),
                              //                     space(h: 10),
                              //                     if (permisosModel.configuracion == 1)
                              //                       BotonMenu(
                              //                         fun: () {
                              //                           controller.jumpToPage(12);
                              //                         },
                              //                         texto: "Configuracion",
                              //                         icon: Icons.settings,
                              //                       ),
                            
  //         Expanded(
  //           child: Column(
  //             children: [
  //               Container(
  //                 padding: const EdgeInsets.only(left: 30, top: 10),
  //                 width: double.infinity,
  //                 height: 70,
  //                 decoration: const BoxDecoration(color: Colors.white, boxShadow: [
  //                   BoxShadow(
  //                     color: Colors.black,
  //                     blurRadius: 10.0,
  //                   ),
  //                 ]),
  //                 child: SingleChildScrollView(
  //                   scrollDirection: Axis.horizontal,
  //                   child: Row(
  //                     children: [
  //                       Text(
  //                         "Bienvenido denuevo ${userState.user.nombreCompleto}!",
  //                         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               space(h: 30),
  //               //  Expanded(child: pageViewList())
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

//   PageView pageViewList() {
//     return PageView(
//       controller: controller,
//       children: [
//         HomePage(),
//         RegistrarSalidaPage(),
//         BuscarSalidaPage(),
//         ListarSalidaPage(),
//         RegistrarEntradaPage(),
//         BuscarEntradaPage(),
//         ListarEntradaPage(),
//         DetalleProducto(),
//         CargarProductoPage(),
//         ClientsView(),
//         ProveedoresView(),
//         InventoryView(),
//         SettingsView()
//       ],
//     );
//   }
// }

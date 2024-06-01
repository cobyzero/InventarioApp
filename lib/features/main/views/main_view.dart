import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
import 'package:inventarioapp/core/util/palette.dart';
import 'package:inventarioapp/core/util/texts.dart';
import 'package:inventarioapp/features/main/controllers/main_controller.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:sizer/sizer.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getMenus();
    return Scaffold(
      backgroundColor: Palette.kPrimary,
      appBar: AppBar(
        backgroundColor: Palette.kPrimary,
        leading: IconButton(
          onPressed: () {
            controller.drawerController
                .setExtended(!controller.drawerController.extended);
            controller.isOpen(controller.drawerController.extended);
          },
          icon: Icon(
            Icons.menu,
            size: 14.sp,
            color: Palette.white,
          ),
        ),
        title: Texts.bold(
          "Bienvenido! ${controller.authService.userModel.nombreCompleto}",
          fontSize: 13,
          color: Palette.white,
        ),
        centerTitle: true,
      ),
      body: Row(
        children: [
          Obx(() {
            return SidebarX(
              showToggleButton: false,
              controller: controller.drawerController,
              theme: SidebarXTheme(
                hoverTextStyle: const TextStyle(
                  color: Palette.white,
                  fontWeight: FontWeight.bold,
                ),
                width: 13.w,
                decoration: const BoxDecoration(
                  color: Palette.kPrimary,
                ),
                selectedIconTheme: const IconThemeData(
                  color: Palette.white,
                ),
                selectedItemTextPadding: EdgeInsets.only(left: 2.w),
                selectedItemPadding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                selectedTextStyle: const TextStyle(
                  color: Palette.white,
                  fontWeight: FontWeight.bold,
                ),
                selectedItemDecoration: BoxDecoration(
                  color: Palette.black.withOpacity(.4),
                  borderRadius: BorderRadius.circular(20.sp),
                ),
                iconTheme: IconThemeData(
                  size: 10.sp,
                  color: Palette.greyBlack,
                ),
              ),
              extendedTheme: SidebarXTheme(
                width: 40.w,
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                itemTextPadding: EdgeInsets.only(left: 2.w),
                itemPadding:
                    EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                textStyle: const TextStyle(
                  color: Palette.greyBlack,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const BoxDecoration(
                  color: Palette.kPrimary,
                ),
              ),
              items: controller.menus
                  .map(
                    (element) => SidebarXItem(
                      label: element.title,
                      iconBuilder: (selected, hovered) {
                        return Image.network(
                          element.image,
                          color: hovered
                              ? Palette.white
                              : selected
                                  ? Palette.white
                                  : Palette.greyBlack,
                          width: 4.w,
                          height: 4.w,
                        );
                      },
                    ),
                  )
                  .toList(),
            );
          }),
          Expanded(
            child: PageView(
              controller: controller.pageController,
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
            ),
          ),
        ],
      ),
    );
  }
}

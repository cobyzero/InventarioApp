import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart'; 
import 'package:inventarioapp/core/network/dio.dart';
import 'package:inventarioapp/features/auth/controllers/auth_controller.dart';
import 'package:inventarioapp/features/main/models/menu_model.dart';
import 'package:sidebarx/sidebarx.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    getMenus();
    super.onInit();
  }

  final drawerController = SidebarXController(selectedIndex: 0, extended: true);
  final authService = Get.find<AuthController>();
  final pageController = PageController();
  final isOpen = false.obs;
  final loading = true.obs;
  final menus = <MenuModel>[].obs;

  Future<void> getMenus() async {
    try {
      loading(true);
      menus.clear();

      final response = await dio.get("getMenus/${authService.userModel.idPermisos}");

      menus.addAll(
        (response.data as List).map((e) => MenuModel.fromJson(e)),
      );
    } catch (e) {
      log(e.toString());
    } finally {
      loading(false);
    }
  }
}

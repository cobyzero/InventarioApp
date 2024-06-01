import 'package:get/get.dart';
import 'package:inventarioapp/features/auth/controllers/auth_binding.dart';
import 'package:inventarioapp/features/auth/views/login_view.dart';
import 'package:inventarioapp/features/main/controllers/main_binding.dart';
import 'package:inventarioapp/features/main/views/main_view.dart';

final getRouter = <GetPage>[
  GetPage(
    name: "/login",
    page: () => const LoginView(),
    binding: AuthBinding(),
  ),
  GetPage(
    name: "/main",
    page: () => MainView(),
    binding: MainBinding(),
  ),
];

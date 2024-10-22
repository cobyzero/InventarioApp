import 'package:go_router/go_router.dart';
import 'package:inventarioapp/Features/Auth/Presentation/Views/loginView.dart';
import 'package:inventarioapp/Views/Main/mainPage.dart';

final routesApp = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: "/home",
      builder: (context, state) => MainView(),
    ),
  ],
);

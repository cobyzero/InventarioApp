import 'package:go_router/go_router.dart';
import 'package:inventarioapp/Features/Main/Presentation/Views/mainPage.dart';
import 'package:inventarioapp/v2/ui/pages/auth/login_page.dart';

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

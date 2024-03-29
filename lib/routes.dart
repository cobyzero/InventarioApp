import 'package:go_router/go_router.dart';
import 'package:inventarioapp/Features/Auth/Infraestructure/Presentation/Screens/login_screen.dart';
import 'package:inventarioapp/Features/Main/Infraestructure/Presentation/Screens/main_screen.dart';

GoRouter goRoute = GoRouter(
  initialLocation: "/login",
  routes: [
    GoRoute(
      path: "/login",
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: "/main",
      builder: (context, state) => MainScreen(),
    ),
  ],
);

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventarioapp/Core/Dependencies/injector.dart';
import 'package:inventarioapp/Core/Router/routes.dart';
import 'package:inventarioapp/Features/Auth/Application/Repositories/auth_irepository.dart';
import 'package:inventarioapp/Features/Auth/Application/bloc/auth_bloc.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            getIt<AuthIRepository>(),
          ),
        ),
      ],
      child: ResponsiveSizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: routesApp,
            theme: ThemeData(
              textTheme: GoogleFonts.poppinsTextTheme(),
            ),
          );
        },
      ),
    );
  }
}

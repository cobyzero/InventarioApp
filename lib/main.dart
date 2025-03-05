import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inventarioapp/Features/Main/Application/Repositories/main_irepository.dart';
import 'package:inventarioapp/Features/Main/Application/bloc/main_bloc.dart';
import 'package:inventarioapp/v2/data/repositories/auth_irepository.dart';
import 'package:inventarioapp/v2/dependency_injection/injector.dart';
import 'package:inventarioapp/v2/domain/blocs/auth_bloc/auth_bloc.dart';
import 'package:inventarioapp/v2/ui/routes.dart';
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
        BlocProvider(
          create: (context) => MainBloc(
            getIt<MainIRepository>(),
          )..add(GetModulesEvent()),
        ),
      ],
      child: Sizer(
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

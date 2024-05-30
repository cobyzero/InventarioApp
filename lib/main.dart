import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventarioapp/Core/Dependency_injection/dependency_injection.dart';
import 'package:inventarioapp/Features/Auth/Application/Bloc/login_bloc/login_bloc.dart';
import 'package:inventarioapp/routes.dart';

Future<void> main() async {
  dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginBloc(
            getIt.get(),
          ),
        )
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: goRoute,
      ),
    );
  }
}

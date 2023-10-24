import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inventarioapp/Core/Dependency_injection/dependency_injection.dart';
import 'package:inventarioapp/Features/Auth/Application/Bloc/login_bloc/login_bloc.dart';
import 'package:inventarioapp/Features/Main/Application/Blocs/Main_bloc/main_bloc.dart';
import 'package:inventarioapp/Features/User/Application/Blocs/user_bloc/user_bloc.dart';
import 'package:inventarioapp/firebase_options.dart';
import 'package:inventarioapp/routes.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  dependencyInjection();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt.get<LoginBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<UserBloc>(),
          ),
          BlocProvider(
            create: (context) => getIt.get<MainBloc>(),
          ),
        ],
        child: Sizer(
          builder: (context, orientation, deviceType) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: goRoute,
            );
          },
        ));
  }
}

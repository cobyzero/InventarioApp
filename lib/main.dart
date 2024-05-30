import 'package:flutter/material.dart';
import 'package:inventarioapp/Providers/providerMain.dart';
import 'package:inventarioapp/routes.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProviderMain(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "login",
        routes: routesApp(),
      ),
    );
  }
}

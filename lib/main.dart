import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventarioapp/routes.dart';
import 'package:sizer/sizer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: "/login",
          getPages: getRouter,
        );
      },
    );
  }
}

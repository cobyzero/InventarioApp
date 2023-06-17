import 'package:flutter/material.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Views/Home/Widgets/homeCardData.dart';
import 'package:inventarioapp/Views/Home/Widgets/homeGraficoData.dart';
import 'package:inventarioapp/Views/Home/Widgets/homeStockLimit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<ProductosModel> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeCardData(),
            space(h: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(w: 20),
                  const HomeGraphicData(),
                  HomeStockLimit(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

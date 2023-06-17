import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/Services/mainService.dart';

class HomeGraphicData extends StatelessWidget {
  const HomeGraphicData({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MainService.getGraficoEntradas(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
                ],
              ),
              child: GraficosBase2(snapshot.data![0], snapshot.data![1]));
        } else {
          return Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
                ],
              ),
              child: GraficosBase2([], []));
        }
      },
    );
  }
}

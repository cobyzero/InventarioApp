import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/sales_data_entity.dart';

class HomeGraphicData extends StatelessWidget {
  const HomeGraphicData({
    super.key,
    required this.entradas,
    required this.salidas,
  });
  final List<SalesDataEntity> entradas;
  final List<SalesDataEntity> salidas;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
        ],
      ),
      child: GraficosBase2(entradas, salidas),
    );
  }
}

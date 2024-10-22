import 'package:flutter/material.dart';
import 'package:inventarioapp/Features/Home/Domain/Entities/sales_data_entity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraficosBase2 extends StatelessWidget {
  List<SalesDataEntity> data;
  List<SalesDataEntity> data2;
  GraficosBase2(this.data, this.data2, {super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 400,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          // Chart title
          // Enable legend
          legend: Legend(isVisible: true),
          // Enable tooltip
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<SalesDataEntity, String>>[
            LineSeries<SalesDataEntity, String>(
                dataSource: data,
                xValueMapper: (SalesDataEntity sales, _) => sales.year,
                yValueMapper: (SalesDataEntity sales, _) => sales.sales,
                name: 'Entradas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
            LineSeries<SalesDataEntity, String>(
                dataSource: data2,
                xValueMapper: (SalesDataEntity sales, _) => sales.year,
                yValueMapper: (SalesDataEntity sales, _) => sales.sales,
                name: 'Salidas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]),
    );
  }
}

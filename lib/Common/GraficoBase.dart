import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraficosBase extends StatefulWidget {
  const GraficosBase({super.key});

  @override
  State<GraficosBase> createState() => _GraficosBaseState();
}

class _GraficosBaseState extends State<GraficosBase> {
  List<_SalesData> data = [
    _SalesData('Jan', 85),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      height: 400,
      child: SfCartesianChart(
          primaryXAxis: CategoryAxis(),
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Almacen',
                dataLabelSettings: const DataLabelSettings(isVisible: true))
          ]),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

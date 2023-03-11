import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraficosBase2 extends StatefulWidget {
  const GraficosBase2({super.key});

  @override
  State<GraficosBase2> createState() => _GraficosBase2State();
}

class _GraficosBase2State extends State<GraficosBase2> {
  List<_SalesData> data = [
    _SalesData('Jan', 85),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  List<_SalesData> data2 = [
    _SalesData('Jan', 15),
    _SalesData('Feb', 68),
    _SalesData('Mar', 94),
    _SalesData('Apr', 12),
    _SalesData('May', 20)
  ];

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
          series: <ChartSeries<_SalesData, String>>[
            LineSeries<_SalesData, String>(
                dataSource: data,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Entradas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
            LineSeries<_SalesData, String>(
                dataSource: data2,
                xValueMapper: (_SalesData sales, _) => sales.year,
                yValueMapper: (_SalesData sales, _) => sales.sales,
                name: 'Salidas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

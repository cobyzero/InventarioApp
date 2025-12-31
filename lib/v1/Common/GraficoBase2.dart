import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class GraficosBase2 extends StatelessWidget {
  List<SalesData> data;
  List<SalesData> data2;
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
          series: <ChartSeries<SalesData, String>>[
            LineSeries<SalesData, String>(
                dataSource: data,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Entradas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
            LineSeries<SalesData, String>(
                dataSource: data2,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                name: 'Salidas',
                // Enable data label
                dataLabelSettings: DataLabelSettings(isVisible: true)),
          ]),
    );
  }
}

class SalesData {
  String? year;
  int? sales;

  SalesData({this.year, this.sales});

  SalesData.fromJson(Map<String, dynamic> json) {
    year = json['year'];
    sales = json['sales'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    data['sales'] = this.sales;
    return data;
  }
}

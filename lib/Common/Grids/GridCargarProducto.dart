import 'package:flutter/material.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridProducto extends StatelessWidget {
  GridProducto({super.key, required this.data});
  List<ProductosModel> data;

  late EmployeeDataSource source;

  @override
  Widget build(BuildContext context) {
    source = EmployeeDataSource(employeeData: data);
    return SfDataGrid(source: source, columns: [
      GridColumn(
          width: 200,
          columnName: "CodigoProducto",
          label: const Center(child: Text("CodigoProducto"))),
      GridColumn(
          width: 350,
          columnName: "DescripcionProducto",
          label: const Center(child: Text("DescripcionProducto"))),
      GridColumn(width: 200, columnName: "Estado", label: const Center(child: Text("Estado")))
    ]);
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<ProductosModel> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell(columnName: "CodigoProducto", value: e.Codigo),
              DataGridCell(columnName: "DescripcionProducto", value: e.Descripcion),
              const DataGridCell(columnName: "Estado", value: "Correcto")
            ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(e.value.toString()),
      );
    }).toList());
  }
}

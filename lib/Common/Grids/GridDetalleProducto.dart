import 'package:flutter/material.dart';
import 'package:inventarioapp/Controllers/productosController.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridDetalleProducto extends StatelessWidget {
  GridDetalleProducto({super.key, required this.data});
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
      GridColumn(
          width: 350,
          columnName: "LongitudProducto",
          label: const Center(child: Text("LongitudProducto"))),
      GridColumn(
          width: 350,
          columnName: "AlmacenProducto",
          label: const Center(child: Text("AlmacenProducto"))),
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
              DataGridCell(columnName: "LongitudProducto", value: e.Longitud),
              DataGridCell(columnName: "AlmacenProducto", value: e.Almacen),
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

import 'package:flutter/material.dart';
import 'package:inventarioapp/Models/salidasModel.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class GridBase extends StatefulWidget {
  @override
  State<GridBase> createState() => _GridBaseState();
}

class _GridBaseState extends State<GridBase> {
  List<Salidas> data = [
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
    Salidas(
        idSalida: 0,
        NumeroDocumento: "0001",
        FechaRegistro: DateTime.now(),
        UsuarioRegistro: "Cobyzero",
        DocumentoCliente: "56346767",
        NombreCliente: "SAC Blem",
        CantidadProductos: 40,
        IdProducto: 4,
        CodigoProducto: "SK-4",
        DescripcionProducto: "Stromkabel Schuko C15 - C14",
        LongitudProducto: "5.0m",
        AlmacenProducto: "alm01"),
  ];

  late EmployeeDataSource source;

  @override
  void initState() {
    source = EmployeeDataSource(employeeData: data);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
          width: 200,
          columnName: "CantidadProductos",
          label: const Center(child: Text("CantidadProductos")))
    ]);
  }
}

class EmployeeDataSource extends DataGridSource {
  /// Creates the employee data source class with required details.
  EmployeeDataSource({required List<Salidas> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell(columnName: "CodigoProducto", value: e.CodigoProducto),
              DataGridCell(columnName: "DescripcionProducto", value: e.DescripcionProducto),
              DataGridCell(columnName: "CantidadProductos", value: e.CantidadProductos)
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

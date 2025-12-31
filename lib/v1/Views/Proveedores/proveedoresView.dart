import 'package:flutter/material.dart';
import 'package:inventarioapp/v1/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/v1/Common/baseVentana.dart';
import 'package:inventarioapp/v1/Common/botonBase.dart';
import 'package:inventarioapp/v1/Util/colors.dart';
import 'package:inventarioapp/v1/Common/common.dart';
import 'package:inventarioapp/v1/Views/Proveedores/Widgets/proveedoresLeftContainer.dart';
import 'package:inventarioapp/v1/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/v1/ViewModels/proveedorController.dart';
import 'package:inventarioapp/v1/Models/proveedoresModel.dart';

class ProveedoresView extends StatefulWidget {
  const ProveedoresView({super.key});

  @override
  State<ProveedoresView> createState() => _ProveedoresViewState();
}

class _ProveedoresViewState extends State<ProveedoresView> {
  var columns = ["", "Numero Documento", "Nombre Completo"];

  List<ProveedoresModel> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BaseVentana(
          fun: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProveedoresLeftContainer(),
          space(w: 20),
          lineaContainer(w: 2, h: double.infinity),
          space(w: 40),
          Expanded(
              child: NewGridBase(
            columns: getColumns(),
            rows: getRows(data),
          ))
        ],
      )),
    );
  }

  getRows(List<ProveedoresModel> data) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            setDetalleProducto(element);
          },
        )),
        DataCell(Text(element.NumeroDocumento)),
        DataCell(Text(element.NombreCompleto)),
      ]));
      count++;
    }
    return rows;
  }

  setDetalleProducto(ProveedoresModel model) {
    // productoSelecionado = model;
    // numeroDocumento.text = model.NumeroDocumento;
    // nombreCompleto.text = model.NombreCompleto;
  }

  getColumns() {
    List<DataColumn> columnsTemp = [];

    for (var element in columns) {
      columnsTemp.add(DataColumn(label: Text(element)));
    }

    return columnsTemp;
  }
}

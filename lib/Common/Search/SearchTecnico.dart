import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Controllers/entradasController.dart';
import 'package:inventarioapp/Controllers/salidasController.dart';
import 'package:inventarioapp/Models/proveedoresModel.dart';
import 'package:inventarioapp/Models/tecnicosModel.dart';

class SearchTecnico {
  Function(TecnicoModel model) setDetalleProveedor;
  BuildContext context;

  List<TecnicoModel> dataProveedor = [];
  var columnsProveedor = ["", "Numero Documento", "Nombre Completo"];

  SearchTecnico(this.setDetalleProveedor, this.context);

  _getRowsProveedor(List<TecnicoModel> dataTemp) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in dataTemp) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            setDetalleProveedor(element);
          },
        )),
        DataCell(Text(element.numeroDocumento!)),
        DataCell(Text(element.nombreCompleto!)),
      ]));
      count++;
    }
    return rows;
  }

  searchProveedor() async {
    dataProveedor = await SalidasController.getTecnicos();
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Proveedores"),
          content: NewGridBase(
              columns: NewGridBase.getColumns(columnsProveedor),
              rows: _getRowsProveedor(dataProveedor)),
        );
      },
    );
  }
}

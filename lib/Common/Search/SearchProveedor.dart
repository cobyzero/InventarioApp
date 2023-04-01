import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Controllers/proveedorController.dart';
import 'package:inventarioapp/Models/proveedoresModel.dart';

class SearchProveedor {
  Function(ProveedoresModel model) setDetalleProveedor;
  BuildContext context;
  List<ProveedoresModel> dataProveedor = [];

  var columnsProveedor = ["", "Numero Documento", "Nombre Completo"];

  SearchProveedor(this.setDetalleProveedor, this.context);

  _getRowsProveedor(List<ProveedoresModel> dataTemp) {
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
        DataCell(Text(element.NumeroDocumento)),
        DataCell(Text(element.NombreCompleto)),
      ]));
      count++;
    }
    return rows;
  }

  Future<void> searchProveedor() async {
    dataProveedor =
        await ProveedorController.getProveedores().whenComplete(() => Navigator.pop(context));

    // ignore: use_build_context_synchronously
    showDialog(
      barrierDismissible: false,
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

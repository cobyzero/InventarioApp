import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/ViewModels/productosController.dart';

class SearchProucto {
  Function(ProductosModel model) setDetalleProveedor;
  BuildContext context;
  List<ProductosModel> dataProveedor = [];

  var columnsProveedor = ["", "Codigo", "Descripcion", "Longitud", "Almacen"];

  SearchProucto(this.setDetalleProveedor, this.context);

  _getRowsProveedor(List<ProductosModel> dataTemp) {
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
        DataCell(Text(element.codigo)),
        DataCell(Text(element.descripcion)),
        DataCell(Text(element.longitud)),
        DataCell(Text(element.almacen)),
      ]));
      count++;
    }
    return rows;
  }

  Future<void> searchProveedor() async {
    dataProveedor = await ProductosController.getProductos()
        .whenComplete(() => Navigator.pop(context));

    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Productos"),
          content: NewGridBase(
              columns: NewGridBase.getColumns(columnsProveedor),
              rows: _getRowsProveedor(dataProveedor)),
        );
      },
    );
  }
}

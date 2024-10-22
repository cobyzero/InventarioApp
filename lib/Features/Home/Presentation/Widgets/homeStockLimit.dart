import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Util/const.dart';

class HomeStockLimit extends StatelessWidget {
  final List<ProductosModel> productosStockLimit;
  const HomeStockLimit({
    super.key,
    required this.productosStockLimit,
  });
  static const listaColumns = [
    "Codigo",
    "Descripcion",
    "Longitud",
    "Almacen",
    "Stock Actual"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        width: 600,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
        ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "Productos con stock menor al limite ($MAX_STOCK_LIMIT)",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: NewGridBase(
                columns: NewGridBase.getColumns(listaColumns),
                rows: getRows(productosStockLimit),
              ),
            )
          ],
        ));
  }

  getRows(List<ProductosModel> data) {
    List<DataRow> rows = [];

    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.codigo)),
        DataCell(Text(element.descripcion)),
        DataCell(Text(element.longitud)),
        DataCell(Text(element.almacen)),
        DataCell(Text(element.stock.toString())),
      ]));
    }
    return rows;
  }
}

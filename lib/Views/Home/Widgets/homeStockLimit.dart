import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Util/const.dart';
import 'package:inventarioapp/Services/mainService.dart';

class HomeStockLimit extends StatelessWidget {
  HomeStockLimit({super.key});
  var listaColumns = ["Codigo", "Descripcion", "Longitud", "Almacen", "Stock Actual"];

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 30),
        width: 600,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "Productos con stock menor al limite ($MAX_STOCK_LIMIT)",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
            ),
            FutureBuilder(
              future: MainService.getProductosStock(MAX_STOCK_LIMIT),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NewGridBase(
                        columns: NewGridBase.getColumns(listaColumns),
                        rows: getRows(snapshot.data!)),
                  );
                } else {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: NewGridBase(columns: NewGridBase.getColumns(listaColumns), rows: []),
                  );
                }
              },
            ),
          ],
        ));
  }

  getRows(List<ProductosModel> data) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.Codigo)),
        DataCell(Text(element.Descripcion)),
        DataCell(Text(element.Longitud)),
        DataCell(Text(element.Almacen)),
        DataCell(Text(element.Stock.toString())),
      ]));
      count++;
    }
    return rows;
  }
}

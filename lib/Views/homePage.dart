import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/cardBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/GraficoBase.dart';
import 'package:inventarioapp/Controllers/mainController.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ProductosModel> data = [];
  int max = 20;
  var listaColumns = ["Codigo", "Descripcion", "Longitud", "Almacen", "Stock Actual"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            cardsDatos(),
            space(h: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  space(w: 20),
                  FutureBuilder(
                    future: MainController.getGraficoEntradas(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
                              ],
                            ),
                            child: GraficosBase2(snapshot.data![0], snapshot.data![1]));
                      } else {
                        return Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [
                                BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
                              ],
                            ),
                            child: GraficosBase2([], []));
                      }
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 30),
                      width: 600,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(boxShadow: const [
                        BoxShadow(blurRadius: 10, color: Colors.grey, offset: Offset(5, 5))
                      ], color: Colors.white, borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Text(
                            "Productos con stock menor al limite ($max)",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.red),
                          ),
                          FutureBuilder(
                            future: MainController.getProductosStock(max),
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
                                  child: NewGridBase(
                                      columns: NewGridBase.getColumns(listaColumns), rows: []),
                                );
                              }
                            },
                          ),
                        ],
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
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

  SingleChildScrollView cardsDatos() {
    return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: MainController.getResquestEntradasCount(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  CardBase(
                    cantidad: snapshot.data![0],
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: snapshot.data![1],
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: snapshot.data![2],
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: snapshot.data![3],
                    color: Colors.green,
                    texto: "Usuarios",
                  ),
                ],
              );
            } else {
              return Row(
                children: [
                  CardBase(
                    cantidad: "0",
                    color: Colors.cyan,
                    texto: "Entradas",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.red,
                    texto: "Salidas",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.yellow,
                    texto: "Almacen",
                  ),
                  CardBase(
                    cantidad: "0",
                    color: Colors.green,
                    texto: "Tecnicos",
                  ),
                ],
              );
            }
          },
        ));
  }
}

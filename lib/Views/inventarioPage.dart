import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Controllers/entradasController.dart';
import 'package:inventarioapp/Controllers/productosController.dart';
import 'package:inventarioapp/Controllers/salidasController.dart';
import 'package:inventarioapp/Models/entradasModel.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Models/salidasModel.dart';

class InventarioPage extends StatefulWidget {
  const InventarioPage({super.key});

  @override
  State<InventarioPage> createState() => _InventarioPageState();
}

class _InventarioPageState extends State<InventarioPage> {
  List<String> columns = [
    "CodigoProducto",
    "Descripcion",
    "Longitud",
    "Almacen",
    "Entradas",
    "Salidas",
    "Stock"
  ];
  List<InventarioModel> data = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Inventario",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () async {
                      cargando(context);
                      setState(() {
                        data.clear();
                      });
                      List<InventarioModel> dataTemp =
                          await getData().whenComplete(() => Navigator.pop(context));
                      setState(() {
                        data = dataTemp;
                      });
                    },
                    icon: const Icon(Icons.refresh))
              ],
            ),
            space(h: 20),
            lineaContainer(),
            space(h: 20),
            NewGridBase(columns: NewGridBase.getColumns(columns), rows: getRows(data)),
            space(h: 20),
            BotonBase(icon: Icons.download, texto: "Descargar Excel")
          ],
        ),
      ),
    );
  }

  getRows(List<InventarioModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.coditoProducto!)),
        DataCell(Text(element.descripcion!)),
        DataCell(Text(element.longitud!)),
        DataCell(Text(element.almacen!)),
        DataCell(Text(element.entradas.toString()!)),
        DataCell(Text(element.salidas.toString()!)),
        DataCell(Text(element.stock.toString()!)),
      ]));
    }
    return rows;
  }

  Future<List<InventarioModel>> getData() async {
    List<ProductosModel> productos = await ProductosController.getProductos();
    List<InventarioModel> inventario = [];
    for (var element in productos) {
      List<EntradasModel> entradasList =
          await EntradasController.getEntradaForProducto(element.IdProducto);
      int entradas = entradasList.length;

      List<SalidasModel> salidasList =
          await SalidasController.getSalidaForProducto(element.IdProducto);
      int salidas = salidasList.length;
      inventario.add(InventarioModel(element.Codigo, element.Descripcion, element.Longitud,
          element.Almacen, entradas, salidas, element.Stock));
    }

    return inventario;
  }
}

class InventarioModel {
  String coditoProducto;
  String descripcion;
  String longitud;
  String almacen;
  int entradas;
  int salidas;
  int stock;

  InventarioModel(this.coditoProducto, this.descripcion, this.longitud, this.almacen, this.entradas,
      this.salidas, this.stock);
}

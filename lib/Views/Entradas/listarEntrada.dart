import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/ViewModels/entradasController.dart';
import 'package:inventarioapp/Models/entradasModel.dart';

class ListarEntradaPage extends StatefulWidget {
  const ListarEntradaPage({super.key});

  @override
  State<ListarEntradaPage> createState() => _ListarEntradaPageState();
}

class _ListarEntradaPageState extends State<ListarEntradaPage> {
  late EntradasModel productoSelecionado;
  List<EntradasModel> data = [];
  var columns = [
    "",
    "Fecha Registro",
    "Nro de Documento",
    "Usuario Registro",
    "Proveedor",
    "Codigo Producto",
    "Descripcion Producto",
    "Longitud Producto",
    "Almacen Producto",
    "Cantidad"
  ];
  List<EntradasModel> dataProducto = [];
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
                  "Listar Entradas",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () async {
                      data.clear();
                      List<EntradasModel> dataTemp = await EntradasController.getEntrada();

                      setState(() {
                        data = dataTemp;
                      });
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            space(h: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: NewGridBase(
                columns: NewGridBase.getColumns(columns),
                rows: getRows(data),
              ),
            ),
            space(h: 20),
            BotonBase(icon: Icons.download, texto: "Descargar Excel")
          ],
        ),
      ),
    );
  }

  getRows(List<EntradasModel> dataTemp) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in dataTemp) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {},
        )),
        DataCell(Text(element.fechaRegistro!)),
        DataCell(Text(element.numeroDocumento!)),
        DataCell(Text(element.usuarioRegistro!)),
        DataCell(Text(element.nombreProveedor!)),
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.longitudProducto!)),
        DataCell(Text(element.almacenProducto!)),
        DataCell(Text(element.cantidadProductos.toString())),
      ]));
      count++;
    }
    return rows;
  }
}

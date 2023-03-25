import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Controllers/salidasController.dart';
import 'package:inventarioapp/Models/salidasModel.dart';

class ListarSalidaPage extends StatefulWidget {
  const ListarSalidaPage({super.key});

  @override
  State<ListarSalidaPage> createState() => _ListarSalidaPageState();
}

class _ListarSalidaPageState extends State<ListarSalidaPage> {
  List<String> columns = [
    "NumeroDocumento",
    "FechaRegistro",
    "DocumentoTenico",
    "NombreTecnico",
    "CodigoProducto",
    "DescripcionProducto",
    "Longitud",
    "Almacen",
    "Cantidad"
  ];
  List<SalidasModel> data = [];
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
                  "Listar Salidas",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () async {
                      setState(() {
                        data.clear();
                      });
                      List<SalidasModel> tempData = await SalidasController.getSalidas();
                      setState(() {
                        data = tempData;
                      });
                    },
                    icon: Icon(Icons.refresh))
              ],
            ),
            space(h: 20),
            lineaContainer(),
            space(h: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: NewGridBase(columns: NewGridBase.getColumns(columns), rows: getRows(data))),
            space(h: 20),
            BotonBase(icon: Icons.download, texto: "Descargar Excel")
          ],
        ),
      ),
    );
  }

  getRows(List<SalidasModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.numeroDocumento!)),
        DataCell(Text(element.fechaRegistro!)),
        DataCell(Text(element.documentoCliente!)),
        DataCell(Text(element.nombreCliente!)),
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.longitudProducto!)),
        DataCell(Text(element.almacenProducto!)),
        DataCell(Text(element.cantidadProductos.toString())),
      ]));
    }
    return rows;
  }
}

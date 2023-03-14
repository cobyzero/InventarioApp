import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/basePdf.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Controllers/entradasController.dart';
import 'package:inventarioapp/Models/entradasModel.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class BuscarEntradaPage extends StatefulWidget {
  const BuscarEntradaPage({super.key});

  @override
  State<BuscarEntradaPage> createState() => _BuscarEntradaPageState();
}

class _BuscarEntradaPageState extends State<BuscarEntradaPage> {
  var numeroDocumento = TextEditingController();
  var fecha = TextEditingController();
  var usuario = TextEditingController();
  var docProveedor = TextEditingController();
  var nombreProveedor = TextEditingController();
  var columns = ["Codigo", "Descripcion", "Longitud", "Almacen", "Cantidad"];
  List<EntradasModel> data = [];
  int total = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Buscar Entrada",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              space(h: 30),
              Fila1(),
              lineaContainer(),
              Fila2(),
              lineaContainer(),
              space(h: 20),
              NewGridBase(columns: NewGridBase.getColumns(columns), rows: getRows(data)),
              space(h: 30),
              Row(
                children: [
                  Text("Total: $total"),
                  space(w: 550),
                  BotonBase(
                    icon: Icons.picture_as_pdf,
                    texto: "Descargar PDF",
                    fun: () async {
                      if (numeroDocumento.text.isEmpty ||
                          fecha.text.isEmpty ||
                          usuario.text.isEmpty ||
                          docProveedor.text.isEmpty ||
                          nombreProveedor.text.isEmpty) {
                        return;
                      }
                      var pdf = pw.Document();

                      BasePdf(pdf, numeroDocumento.text, docProveedor.text, nombreProveedor.text,
                              fecha.text, columns, data)
                          .init();

                      String? picker = await FilePicker.platform.getDirectoryPath();
                      final file = File("$picker/Entrada_${numeroDocumento.text}.pdf");
                      await file.writeAsBytes(await pdf.save());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getRows(List<EntradasModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.longitudProducto!)),
        DataCell(Text(element.almacenProducto!)),
        DataCell(Text(element.cantidadProductos!.toString())),
      ]));
    }
    return rows;
  }

  Fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyTextFormField(
            controller: fecha,
            text: "Fecha",
            readOnliny: true,
          ),
          space(w: 20),
          MyTextFormField(
            controller: usuario,
            text: "Usuario",
            readOnliny: true,
          ),
          space(w: 20),
          MyTextFormField(
            controller: docProveedor,
            text: "Documento Proveedor",
            readOnliny: true,
          ),
          space(w: 20),
          MyTextFormField(
            controller: nombreProveedor,
            text: "Nombre Proveedor",
            readOnliny: true,
          )
        ],
      ),
    );
  }

  Row Fila1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextFormField(controller: numeroDocumento, text: "Numero de Documento"),
        space(w: 20),
        IconButton(
            onPressed: () async {
              if (numeroDocumento.text.isEmpty) {
                return;
              }

              data.clear();

              List<EntradasModel> dataTemp =
                  await EntradasController.getEntradaForDocumento(numeroDocumento.text);

              for (var element in dataTemp) {
                total += element.cantidadProductos!;
              }
              setState(() {
                data = dataTemp;
                fecha.text = dataTemp[0].fechaRegistro!;
                usuario.text = dataTemp[0].usuarioRegistro!;
                docProveedor.text = dataTemp[0].documentoProveedor!;
                nombreProveedor.text = dataTemp[0].nombreProveedor!;
              });
            },
            icon: const Icon(
              Icons.search,
              size: 40,
            )),
        space(w: 20),
        IconButton(
            onPressed: () {
              setState(() {
                data.clear();
                numeroDocumento.text = "";
                fecha.text = "";
                usuario.text = "";
                docProveedor.text = "";
                nombreProveedor.text = "";
                total = 0;
              });
            },
            icon: const Icon(
              Icons.cleaning_services_outlined,
              size: 40,
            ))
      ],
    );
  }
}

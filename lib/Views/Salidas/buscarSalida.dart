import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/ViewModels/salidasController.dart';
import 'package:inventarioapp/Models/salidasModel.dart';

class BuscarSalidaPage extends StatefulWidget {
  const BuscarSalidaPage({super.key});

  @override
  State<BuscarSalidaPage> createState() => _BuscarSalidaPageState();
}

class _BuscarSalidaPageState extends State<BuscarSalidaPage> {
  var numeroDocumento = TextEditingController();
  var fecha = TextEditingController();
  var usuario = TextEditingController();
  var documentoTecnico = TextEditingController();
  var nombreTecnico = TextEditingController();
  List<String> columns = ["Codigo", "Descripcion", "Longitud", "Almacen", "Cantidad"];
  int total = 0;
  @override
  List<SalidasModel> data = [];

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
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
                    "Buscar Salida",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: Icon(Icons.refresh))
                ],
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
                  BotonBase(icon: Icons.picture_as_pdf, texto: "Descargar PDF")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getRows(List<SalidasModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      total += element.cantidadProductos!;
      rows.add(DataRow(cells: [
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.longitudProducto!)),
        DataCell(Text(element.almacenProducto!)),
        DataCell(Text(element.cantidadProductos.toString())),
      ]));
    }
    return rows;
  }

  Fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyTextFormField(controller: fecha, text: "Fecha"),
          space(w: 20),
          MyTextFormField(controller: usuario, text: "Usuario"),
          space(w: 20),
          MyTextFormField(controller: documentoTecnico, text: "Documento Tecnico"),
          space(w: 20),
          MyTextFormField(controller: nombreTecnico, text: "Nombre Tecnico")
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
              List<SalidasModel> tempData =
                  await SalidasController.getSalidaForDocumento(numeroDocumento.text);

              if (tempData.isEmpty) {
                return;
              }
              setState(() {
                data = tempData;
                fecha.text = data[0].fechaRegistro!;
                usuario.text = data[0].usuarioRegistro!;
                nombreTecnico.text = data[0].nombreCliente!;
                documentoTecnico.text = data[0].documentoCliente!;
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
                fecha.text = "";
                usuario.text = "";
                documentoTecnico.text = "";
                nombreTecnico.text = "";
                numeroDocumento.text = "";
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

import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/ViewModels/salidasController.dart';
import 'package:inventarioapp/Models/usuariosModel.dart';

class ClientsView extends StatefulWidget {
  const ClientsView({super.key});

  @override
  State<ClientsView> createState() => _ProveedoresPageState();
}

class _ProveedoresPageState extends State<ClientsView> {
  var numeroDocumento = TextEditingController();
  var nombreCompleto = TextEditingController();

  UsuariosModel productoSelecionado =
      UsuariosModel(idUsuario: 0, nombreCompleto: "", numeroDocumento: "");
  var columns = ["", "Numero Documento", "Nombre Completo"];

  List<UsuariosModel> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BaseVentana(
          fun: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          leftColumn(),
          space(w: 20),
          lineaContainer(w: 2, h: double.infinity),
          space(w: 40),
          Expanded(
              child: NewGridBase(
            columns: getColumns(),
            rows: getRows(data),
          ))
        ],
      )),
    );
  }

  getRows(List<UsuariosModel> data) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            setDetalleProducto(element);
          },
        )),
        DataCell(Text(element.numeroDocumento!)),
        DataCell(Text(element.nombreCompleto!)),
      ]));
      count++;
    }
    return rows;
  }

  setDetalleProducto(UsuariosModel model) {
    productoSelecionado = model;
    numeroDocumento.text = model.numeroDocumento!;
    nombreCompleto.text = model.nombreCompleto!;
  }

  getColumns() {
    List<DataColumn> columnsTemp = [];

    for (var element in columns) {
      columnsTemp.add(DataColumn(label: Text(element)));
    }

    return columnsTemp;
  }

  Column leftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Detalle Usuario",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () async {
                  setState(() {
                    data.clear();
                    numeroDocumento.text = "";
                    nombreCompleto.text = "";
                  });
                  productoSelecionado.idUsuario = 0;
                  List<UsuariosModel> listaTemp = await SalidasController.getTecnicos();

                  setState(() {
                    data = listaTemp;
                  });
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        space(h: 30),
        MyTextFormField(controller: numeroDocumento, text: "Numero Documento"),
        space(h: 20),
        MyTextFormField(controller: nombreCompleto, text: "Nombre Completo"),
        space(h: 30),
        BotonBase(
            icon: Icons.save,
            texto: "Guardar",
            w: 280,
            fun:
                null /*() {
            if (productoSelecionado.idUsuario! < 1) {
              return;
            }

            productoSelecionado.numeroDocumento = numeroDocumento.text;
            productoSelecionado.nombreCompleto = nombreCompleto.text;

            SalidasController.putTecnico(productoSelecionado);

            productoSelecionado.idUsuario = 0;
            numeroDocumento.text = "";
            nombreCompleto.text = "";
          },*/
            ),
        space(h: 10),
        BotonBase(
            icon: Icons.delete,
            texto: "Borrar",
            w: 280,
            fun:
                null /*() {
            if (productoSelecionado.idUsuario! < 1) {
              return;
            }
            SalidasController.deleteTecnico(productoSelecionado.idUsuario!);

            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("System Message"),
                  content: Text("Eliminado Correctamente"),
                );
              },
            );

            numeroDocumento.text = "";
            nombreCompleto.text = "";

            productoSelecionado.idUsuario = 0;
          },*/
            ),
        space(h: 10),
        BotonBase(
          icon: Icons.clear,
          texto: "Limpiar",
          w: 280,
          fun: () {
            numeroDocumento.text = "";
            nombreCompleto.text = "";

            productoSelecionado.idUsuario = 0;
          },
        )
      ],
    );
  }
}

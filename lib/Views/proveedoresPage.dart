import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Controllers/proveedorController.dart';
import 'package:inventarioapp/Models/proveedoresModel.dart';

class ProveedoresPage extends StatefulWidget {
  const ProveedoresPage({super.key});

  @override
  State<ProveedoresPage> createState() => _ProveedoresPageState();
}

class _ProveedoresPageState extends State<ProveedoresPage> {
  var numeroDocumento = TextEditingController();
  var nombreCompleto = TextEditingController();

  ProveedoresModel productoSelecionado = ProveedoresModel(0, "", "");
  var columns = ["", "Numero Documento", "Nombre Completo"];

  List<ProveedoresModel> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
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

  getRows(List<ProveedoresModel> data) {
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
        DataCell(Text(element.NumeroDocumento)),
        DataCell(Text(element.NombreCompleto)),
      ]));
      count++;
    }
    return rows;
  }

  setDetalleProducto(ProveedoresModel model) {
    productoSelecionado = model;
    numeroDocumento.text = model.NumeroDocumento;
    nombreCompleto.text = model.NombreCompleto;
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
              "Detalle Proveedor",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () async {
                  setState(() {
                    data.clear();
                    numeroDocumento.text = "";
                    nombreCompleto.text = "";
                  });
                  productoSelecionado.IdProveedor = 0;
                  List<ProveedoresModel> listaTemp = await ProveedorController.getProveedores();

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
          fun: () {
            if (productoSelecionado.IdProveedor < 1) {
              return;
            }

            productoSelecionado.NumeroDocumento = numeroDocumento.text;
            productoSelecionado.NombreCompleto = nombreCompleto.text;

            ProveedorController.putProducto(productoSelecionado);

            productoSelecionado.IdProveedor = 0;
            numeroDocumento.text = "";
            nombreCompleto.text = "";
          },
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.delete,
          texto: "Borrar",
          w: 280,
          fun: () {
            if (productoSelecionado.IdProveedor < 1) {
              return;
            }
            ProveedorController.deleteProveedor(productoSelecionado.IdProveedor);

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

            productoSelecionado.IdProveedor = 0;
          },
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.clear,
          texto: "Limpiar",
          w: 280,
          fun: () {
            numeroDocumento.text = "";
            nombreCompleto.text = "";

            productoSelecionado.IdProveedor = 0;
          },
        )
      ],
    );
  }
}

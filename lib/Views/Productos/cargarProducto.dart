import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/ViewModels/productosController.dart';
import 'package:inventarioapp/Models/productosModel.dart';

class CargarProductoPage extends StatefulWidget {
  const CargarProductoPage({super.key});

  @override
  State<CargarProductoPage> createState() => _CargarProductoPageState();
}

class _CargarProductoPageState extends State<CargarProductoPage> {
  var archivo = TextEditingController();
  int maxcant = 0;
  int actualcant = 0;
  List<String> columns = ["Codigo Producto", "Descripcion Producto", "Estado"];
  List<ProductosModel> lista = <ProductosModel>[];
  int cantiProductos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BaseVentana(
          fun: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Cargar Producto",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            space(h: 20),
            fila1(),
            space(h: 10),
            Row(
              children: [
                Text(
                  "Resumen: $cantiProductos Productos encontrados",
                  style: const TextStyle(color: Colors.cyan),
                ),
                space(w: 30),
                Text(
                  "Cargando: $actualcant/$maxcant",
                  style: const TextStyle(color: Colors.green),
                ),
              ],
            ),
            space(h: 20),
            BotonBase(
              icon: Icons.download,
              texto: "Descargar Plantilla",
              w: 200,
              fun: () async {
                ByteData data = await rootBundle.load('assets/PlantillaProductos.xlsx');
                var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

                print(data);
                var directory = await FilePicker.platform.getDirectoryPath();

                File('$directory/PlantillaProductos.xlsx')
                  ..createSync(recursive: true)
                  ..writeAsBytesSync(bytes!);
              },
            ),
            space(h: 20),
            NewGridBase(columns: NewGridBase.getColumns(columns), rows: getRows(lista))
          ],
        ),
      )),
    );
  }

  getRows(List<ProductosModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(Text(element.Codigo)),
        DataCell(Text(element.Descripcion)),
        const DataCell(Text(
          "Correcto",
          style: TextStyle(color: Colors.green),
        )),
      ]));
    }
    return rows;
  }

  SingleChildScrollView fila1() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          const Text("Seleccionar Archivo:"),
          space(w: 20),
          MyTextFormField(
            controller: archivo,
            text: "Archivo",
            w: 400,
            readOnliny: true,
          ),
          space(w: 20),
          BotonBase(
            icon: Icons.upload,
            texto: "Subir",
            fun: () async {
              if (maxcant != 0) {
                return;
              }

              FilePickerResult? result = await FilePicker.platform.pickFiles(
                type: FileType.custom,
                allowedExtensions: ['xlsx'],
                allowMultiple: false,
              );

              if (result != null) {
                setState(() {
                  archivo.text = result.paths[0]!;
                });

                var bytes = File(result.paths[0]!).readAsBytesSync();
                var excel = Excel.decodeBytes(bytes);
                var table = excel.tables.keys.first;

                if (excel.tables[table]!.maxCols != 4) {
                  // ignore: use_build_context_synchronously
                  alertMensaje(
                    context,
                    "Columnas Invalidas",
                  );
                  return;
                }

                setState(() {
                  maxcant = excel.tables[table]!.maxRows - 1;
                });
                List<ProductosModel> listaTemp = [];
                for (var i = 1; i <= excel.tables[table]!.maxRows - 1; i++) {
                  List<dynamic> datos = [];

                  for (var e = 0; e < excel.tables[table]!.maxCols; e++) {
                    datos.add(excel.tables[table]!.rows[i][e]!.value);
                  }

                  listaTemp.add(ProductosModel(0, datos[0].toString(), datos[1].toString(),
                      datos[2].toString(), datos[3].toString(), 0));

                  setState(() {
                    actualcant++;
                  });
                }

                setState(() {
                  lista = listaTemp;
                  cantiProductos = listaTemp.length;
                });
              }
            },
          ),
          space(w: 20),
          BotonBase(
            icon: Icons.sync,
            texto: "Procesar",
            fun: () {
              if (lista.isEmpty) {
                return;
              }

              ProductosController.setProductosList(lista);

              setState(() {
                lista = [];
                cantiProductos = 0;
                maxcant = 0;
                actualcant = 0;
              });
            },
          )
        ],
      ),
    );
  }
}

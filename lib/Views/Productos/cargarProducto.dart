import 'dart:io';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/GridProducto.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Controllers/productosController.dart';
import 'package:inventarioapp/Models/proudctosModel.dart';

class CargarProductoPage extends StatefulWidget {
  const CargarProductoPage({super.key});

  @override
  State<CargarProductoPage> createState() => _CargarProductoPageState();
}

class _CargarProductoPageState extends State<CargarProductoPage> {
  var archivo = TextEditingController();
  int maxcant = 0;
  int actualcant = 0;

  List<ProductosModel> lista = <ProductosModel>[];
  int cantiProductos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: BaseVentana(
          fun: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  "Cargar Producto",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh))
              ],
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
            ),
            space(h: 20),
            SizedBox(
              width: double.infinity,
              height: 600,
              child: GridProducto(
                data: lista.isEmpty ? [] : lista,
              ),
            ),
          ],
        ),
      )),
    );
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
                  showDialog(
                      context: context,
                      builder: alertMensaje(
                        "Columnas Invalidas",
                      ));
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

                  int existe = await ProductosController.checkProductoId(datos[0].toString());

                  listaTemp.add(ProductosModel(0, datos[0].toString(), datos[1].toString(),
                      datos[2].toString(), datos[3].toString(), 0, existe));

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

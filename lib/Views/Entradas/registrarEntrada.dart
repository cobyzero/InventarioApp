import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:inventarioapp/Controllers/entradasController.dart';
import 'package:inventarioapp/Controllers/productosController.dart';
import 'package:inventarioapp/Controllers/proveedorController.dart';
import 'package:inventarioapp/Models/entradasModel.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Models/proveedoresModel.dart';

class RegistrarEntradaPage extends StatefulWidget {
  const RegistrarEntradaPage({super.key});

  @override
  State<RegistrarEntradaPage> createState() => _RegistrarEntradaPageState();
}

class _RegistrarEntradaPageState extends State<RegistrarEntradaPage> {
  ///Controladores de los Texbox
  var numDocumento = TextEditingController();
  var fechaRegistro = TextEditingController();
  var docProveedor = TextEditingController();
  var nombreProveedor = TextEditingController();
  var codigoProducto = TextEditingController();
  var descripcionProducto = TextEditingController();
  var cantidad = TextEditingController();

  ///Requerimientos para el DataTable [Entradas]
  late EntradasModel entradaSelecionado;
  var columns = ["", "Codigo", "Descripcion", "Cantidad", "Longitud", "Almacen"];
  List<EntradasModel> data = [];

  ///Requerimientos para el DataTable [Proveedores]
  late ProveedoresModel proveedorSelecionado;
  var columnsProveedor = ["", "Numero Documento", "Nombre Completo"];
  List<ProveedoresModel> dataProveedor = [];

  ///Requerimientos para el DataTable [Productos]
  late ProductosModel productoSelecionado;
  var columnsProducto = ["", "Codigo", "Descripcion", "Longitud", "Almacen"];
  List<ProductosModel> dataProducto = [];

  ///variables locales
  int total = 0;
  @override
  Widget build(BuildContext context) {
    fechaRegistro.text = fechaHoy();

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
            children: [
              Row(
                children: [
                  const Text(
                    "Registrar Entrada",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(Icons.refresh))
                ],
              ),
              space(h: 30),
              Fila1(),
              lineaContainer(),
              Fila2(),
              lineaContainer(),
              Fila3(),
              lineaContainer(),
              space(h: 20),
              //Expanded(child: Text("dasd"))
              NewGridBase(
                rows: getRows(data),
                columns: NewGridBase.getColumns(columns),
              ),
              space(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total: $total"),
                  space(w: 550),
                  BotonBase(
                    icon: Icons.edit_square,
                    texto: "Guardar Entrada",
                    w: 180,
                    fun: () {
                      if (data.isEmpty) {
                        return;
                      }

                      if (numDocumento.text.isEmpty) {
                        return;
                      }

                      EntradasController.addEntrada(data);

                      setState(() {
                        data.clear();
                        codigoProducto.text = "";
                        descripcionProducto.text = "";
                        productoSelecionado.IdProducto = 0;
                        numDocumento.text = "";
                        total = 0;
                      });
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

  getRowsProducto(List<ProductosModel> dataTemp) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in dataTemp) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            setDetalleProducto(element);
          },
        )),
        DataCell(Text(element.Codigo)),
        DataCell(Text(element.Descripcion)),
        DataCell(Text(element.Longitud)),
        DataCell(Text(element.Almacen)),
      ]));
      count++;
    }
    return rows;
  }

  setDetalleProducto(ProductosModel model) {
    productoSelecionado = model;
    codigoProducto.text = model.Codigo;
    descripcionProducto.text = model.Descripcion;
    Navigator.pop(context);
  }

  getRowsProveedor(List<ProveedoresModel> dataTemp) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in dataTemp) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            setDetalleProveedor(element);
          },
        )),
        DataCell(Text(element.NumeroDocumento)),
        DataCell(Text(element.NombreCompleto)),
      ]));
      count++;
    }
    return rows;
  }

  setDetalleProveedor(ProveedoresModel model) {
    proveedorSelecionado = model;
    docProveedor.text = model.NumeroDocumento;
    nombreProveedor.text = model.NombreCompleto;
    Navigator.pop(context);
  }

  getRows(List<EntradasModel> data) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            deleteProducto(element);
          },
        )),
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.cantidadProductos!.toString())),
        DataCell(Text(element.longitudProducto!)),
        DataCell(Text(element.almacenProducto!)),
      ]));
      count++;
    }
    return rows;
  }

  deleteProducto(EntradasModel count) {
    setState(() {
      data.remove(count);
    });
  }

  SingleChildScrollView Fila3() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(
            controller: codigoProducto,
            text: "Codigo Producto",
            readOnliny: true,
          ),
          space(w: 30),
          MyTextFormField(
              controller: descripcionProducto, text: "Descripcion Producto", readOnliny: true),
          space(w: 20),
          IconButton(
              onPressed: () async {
                List<ProductosModel> dataProveedorTemp = await ProductosController.getProductos();
                setState(() {
                  dataProducto = dataProveedorTemp;
                });
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Productos"),
                      content: NewGridBase(
                          columns: NewGridBase.getColumns(columnsProducto),
                          rows: getRowsProducto(dataProducto)),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              )),
          space(w: 30),
          MyTextFormField(
            controller: cantidad,
            text: "Cantidad",
            w: 100,
            type: TextInputType.number,
          ),
          space(w: 20),
          IconButton(
              onPressed: () {
                try {
                  if (int.parse(cantidad.text) < 0) {
                    return;
                  }
                } catch (e) {
                  return;
                }

                if (docProveedor.text == "" ||
                    nombreProveedor.text == "" ||
                    codigoProducto.text == "" ||
                    descripcionProducto.text == "") {
                  return;
                }

                for (var element in data) {
                  if (element.codigoProducto == codigoProducto.text) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return alertMensaje("Solo puedes agregar un tipo de producto.");
                      },
                    ).whenComplete(() {
                      return;
                    });
                    return;
                  }
                }

                setState(() {
                  total += int.parse(cantidad.text);
                  data.add(EntradasModel(
                      0,
                      numDocumento.text,
                      DateTime.now().toIso8601String(),
                      "Admin",
                      docProveedor.text,
                      nombreProveedor.text,
                      int.parse(cantidad.text),
                      productoSelecionado.IdProducto,
                      codigoProducto.text,
                      descripcionProducto.text,
                      productoSelecionado.Longitud,
                      productoSelecionado.Almacen));
                });
              },
              icon: const Icon(
                Icons.add,
                size: 40,
              )),
        ],
      ),
    );
  }

  SingleChildScrollView Fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(
            controller: docProveedor,
            text: "Doc. Proveedor",
            readOnliny: true,
          ),
          space(w: 30),
          MyTextFormField(
            controller: nombreProveedor,
            text: "Nombre Proveedor",
            readOnliny: true,
          ),
          space(w: 20),
          IconButton(
              onPressed: () async {
                List<ProveedoresModel> dataProveedorTemp =
                    await ProveedorController.getProveedores();
                setState(() {
                  dataProveedor = dataProveedorTemp;
                });
                // ignore: use_build_context_synchronously
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Proveedores"),
                      content: NewGridBase(
                          columns: NewGridBase.getColumns(columnsProveedor),
                          rows: getRowsProveedor(dataProveedor)),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              ))
        ],
      ),
    );
  }

  SingleChildScrollView Fila1() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyTextFormField(controller: numDocumento, text: "Nº de Documento"),
          space(w: 30),
          MyTextFormField(controller: fechaRegistro, text: "Fecha Registro")
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
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
  var numDocumento = TextEditingController();
  var fechaRegistro = TextEditingController();
  var docProveedor = TextEditingController();
  var nombreProveedor = TextEditingController();
  var codigoProducto = TextEditingController();
  var descripcionProducto = TextEditingController();
  var cantidad = TextEditingController();
  late EntradasModel productoSelecionado;
  var columns = ["", "Codigo", "Descripcion", "Cantidad", "Longitud", "Almacen"];

  List<EntradasModel> data = [
    EntradasModel(0, "00001", DateTime.now(), "Cobyzero", "01212", "Sebastian", 23, 0212, "SK2",
        "Producto nuevo", "0.23", "Alm01")
  ];

  late ProveedoresModel productoSelecionadoProveedor;
  var columnsProveedor = ["", "Numero Documento", "Nombre Completo"];
  List<ProveedoresModel> dataProveedor = [];

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
                      icon: Icon(Icons.refresh))
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
                columns: getColumns(),
              ),
              space(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text("Total: 23"),
                  space(w: 550),
                  BotonBase(
                    icon: Icons.edit_square,
                    texto: "Guardar Entrada",
                    w: 180,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
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
    productoSelecionadoProveedor = model;
    docProveedor.text = model.NumeroDocumento;
    nombreProveedor.text = model.NombreCompleto;
    Navigator.pop(context);
  }

  getProveedorColumns() {
    List<DataColumn> columnsTemp = [];

    for (var element in columnsProveedor) {
      columnsTemp.add(DataColumn(label: Text(element)));
    }

    return columnsTemp;
  }

  getRows(List<EntradasModel> data) {
    List<DataRow> rows = [];
    int count = 1;
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(TextButton(
          child: Text(count.toString()),
          onPressed: () {
            deleteProducto(element);
          },
        )),
        DataCell(Text(element.CodigoProducto)),
        DataCell(Text(element.DescripcionProducto)),
        DataCell(Text(element.CantidadProductos.toString())),
        DataCell(Text(element.LongitudProducto)),
        DataCell(Text(element.AlmacenProducto)),
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

  getColumns() {
    List<DataColumn> columnsTemp = [];

    for (var element in columns) {
      columnsTemp.add(DataColumn(label: Text(element)));
    }

    return columnsTemp;
  }

  SingleChildScrollView Fila3() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(controller: codigoProducto, text: "Codigo Producto"),
          space(w: 30),
          MyTextFormField(controller: descripcionProducto, text: "Descripcion Producto"),
          space(w: 20),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                size: 40,
              )),
          space(w: 30),
          MyTextFormField(
            controller: cantidad,
            text: "Cantidad",
            w: 100,
          ),
          space(w: 20),
          IconButton(
              onPressed: () {},
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
          MyTextFormField(controller: docProveedor, text: "Doc. Proveedor"),
          space(w: 30),
          MyTextFormField(controller: nombreProveedor, text: "Nombre Proveedor"),
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
                          columns: getProveedorColumns(), rows: getRowsProveedor(dataProveedor)),
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

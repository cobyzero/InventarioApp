import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/Search/SearchProducto.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:inventarioapp/Models/salidasModel.dart';
import 'package:inventarioapp/UserData/UserData.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/ViewModels/salidasController.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';

class RegistrarSalidaPage extends StatefulWidget {
  const RegistrarSalidaPage({super.key});

  @override
  State<RegistrarSalidaPage> createState() => _RegistrarSalidaPageState();
}

class _RegistrarSalidaPageState extends State<RegistrarSalidaPage> {
  var numDocumento = TextEditingController();
  var fechaRegistro = TextEditingController();
  var nombreUsuario = TextEditingController();
  var numeroDocumentoUsuario = TextEditingController();
  var codigoProducto = TextEditingController();
  var descripcionProducto = TextEditingController();
  var stock = TextEditingController();
  var cantidad = TextEditingController();

  late ProductosModel productoSelecionado;
  List<String> columns = ["", "Codigo", "Descripcion", "Cantidad"];

  List<SalidasModel> data = [];
  int total = 0;

  @override
  void initState() {
    numDocumento.text = "AutoGenerado";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fechaRegistro.text = fechaHoy();
    numeroDocumentoUsuario.text = UserData.usuariosModel!.numeroDocumento!;
    nombreUsuario.text = UserData.usuariosModel!.nombreCompleto!;
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Registrar Salida",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              space(h: 30),
              fila1(),
              lineaContainer(),
              fila2(),
              lineaContainer(),
              fila3(),
              lineaContainer(),
              space(h: 20),
              //Expanded(child: Text("dasd"))
              NewGridBase(
                  columns: NewGridBase.getColumns(columns),
                  rows: getRows(data)),
              space(h: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Total: $total"),
                  space(w: 550),
                  BotonBase(
                    icon: Icons.edit_square,
                    texto: "Guardar Salida",
                    fun: () {
                      SalidasController.addSalida(data);

                      setState(() {
                        data.clear();
                        codigoProducto.text = "";
                        descripcionProducto.text = "";
                        productoSelecionado.idProducto = 0;
                        total = 0;

                        numDocumento.text = "AutoGenerado";
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

  getRows(List<SalidasModel> data) {
    List<DataRow> rows = [];
    for (var element in data) {
      rows.add(DataRow(cells: [
        DataCell(IconButton(
          icon: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          onPressed: () {
            setState(() {
              total -= element.cantidadProductos!;
            });
            deleteProducto(element);
          },
        )),
        DataCell(Text(element.codigoProducto!)),
        DataCell(Text(element.descripcionProducto!)),
        DataCell(Text(element.cantidadProductos.toString())),
      ]));
    }
    return rows;
  }

  deleteProducto(SalidasModel count) {
    setState(() {
      data.remove(count);
    });
  }

  SingleChildScrollView fila3() {
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
            controller: descripcionProducto,
            text: "Descripcion Producto",
            readOnliny: true,
          ),
          space(w: 20),
          IconButton(
              onPressed: () async {
                cargando(context);
                await SearchProucto(setDetalleProducto, context)
                    .searchProveedor();
              },
              icon: const Icon(
                Icons.search,
                size: 40,
              )),
          space(w: 30),
          MyTextFormField(
            controller: stock,
            text: "Stock",
            readOnliny: true,
            w: 100,
          ),
          space(w: 30),
          MyTextFormField(
            controller: cantidad,
            text: "Cantidad",
            type: TextInputType.number,
            w: 100,
          ),
          space(w: 20),
          IconButton(
              onPressed: () {
                int _cantidad = 0;
                for (var element in data) {
                  if (element.codigoProducto == productoSelecionado.codigo) {
                    alertMensaje(context, "Solo puede 1 vez por producto.");
                    return;
                  }
                }

                try {
                  _cantidad = int.parse(cantidad.text);
                } catch (e) {
                  return;
                }
                if (int.parse(stock.text) < _cantidad) {
                  alertMensaje(
                      context, "El stock no puede ser menor a la cantidad.");
                  return;
                }
                setState(() {
                  if (total == 0) {
                    numDocumento.text = numeroDocumentoUsuario.text[0] +
                        numeroDocumentoUsuario.text[1] +
                        nombreUsuario.text[0] +
                        nombreUsuario.text[1] +
                        nombreUsuario.text[2] +
                        total.toString() +
                        DateTime.now().day.toString();
                  }
                  total += int.parse(cantidad.text);

                  data.add(SalidasModel(
                      idSalida: 0,
                      numeroDocumento: numDocumento.text,
                      fechaRegistro: DateTime.now().toIso8601String(),
                      usuarioRegistro: "admin",
                      documentoCliente: numeroDocumentoUsuario.text,
                      nombreCliente: nombreUsuario.text,
                      cantidadProductos: _cantidad,
                      idProducto: productoSelecionado.idProducto,
                      codigoProducto: codigoProducto.text,
                      descripcionProducto: descripcionProducto.text,
                      longitudProducto: productoSelecionado.longitud,
                      almacenProducto: productoSelecionado.almacen));
                });

                productoSelecionado.idProducto = 0;
                codigoProducto.text = "";
                descripcionProducto.text = "";
                stock.text = "";
              },
              icon: const Icon(
                Icons.add,
                size: 40,
              )),
        ],
      ),
    );
  }

  SingleChildScrollView fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(
            controller: numeroDocumentoUsuario,
            text: "Doc. Tecnico",
            readOnliny: true,
          ),
          space(w: 30),
          MyTextFormField(
            controller: nombreUsuario,
            text: "Nombre Tecnico",
            readOnliny: true,
          ),
        ],
      ),
    );
  }

  setDetalleProducto(ProductosModel model) {
    productoSelecionado = model;
    codigoProducto.text = model.codigo;
    descripcionProducto.text = model.descripcion;
    stock.text = model.stock.toString();
    Navigator.pop(context);
  }

  SingleChildScrollView fila1() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyTextFormField(
            controller: numDocumento,
            text: "Nº de Documento",
            readOnliny: true,
          ),
          space(w: 30),
          MyTextFormField(
            controller: fechaRegistro,
            text: "Fecha Registro",
            readOnliny: true,
          )
        ],
      ),
    );
  }
}

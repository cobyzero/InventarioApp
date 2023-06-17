import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/Grids/NewGridBase.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Util/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';
import 'package:inventarioapp/ViewModels/productosController.dart';
import 'package:inventarioapp/Models/productosModel.dart';

class DetalleProducto extends StatefulWidget {
  const DetalleProducto({super.key});

  @override
  State<DetalleProducto> createState() => _DetalleProductoState();
}

class _DetalleProductoState extends State<DetalleProducto> {
  var codigo = TextEditingController();
  var descripcion = TextEditingController();
  var longitud = TextEditingController();
  var almacen = TextEditingController();
  List<ProductosModel> data = [];
  late ProductosModel productoSelecionado;

  var listaColumns = ["", "Codigo", "Descripcion", "Longitud", "Almacen"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: BaseVentana(
          fun: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LeftColumn(),
            space(w: 20),
            lineaContainer(w: 2, h: double.infinity),
            space(w: 40),
            NewGridBase(
              columns: NewGridBase.getListColumns(listaColumns),
              rows: getRows(data),
            )
          ],
        ),
      )),
    );
  }

  getRows(List<ProductosModel> data) {
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
    codigo.text = model.Codigo.toString();
    descripcion.text = model.Descripcion;
    longitud.text = model.Longitud;
    almacen.text = model.Almacen;
  }

  LeftColumn() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                "Detalle Producto",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () async {
                    cargando(context);
                    setState(() {
                      data.clear();
                    });

                    codigo.text = "";
                    descripcion.text = "";
                    longitud.text = "";
                    almacen.text = "";
                    var datos = await ProductosController.getProductos()
                        .whenComplete(() => Navigator.pop(context));

                    setState(() {
                      data = datos;
                    });
                  },
                  icon: const Icon(Icons.refresh))
            ],
          ),
          space(h: 20),
          MyTextFormField(
            controller: codigo,
            text: "Codigo",
            readOnliny: true,
          ),
          space(h: 20),
          MyTextFormField(controller: descripcion, text: "Descripcion"),
          space(h: 20),
          MyTextFormField(controller: longitud, text: "Longitud"),
          space(h: 20),
          MyTextFormField(controller: almacen, text: "Almacen"),
          space(h: 30),
          BotonBase(
            icon: Icons.save,
            texto: "Guardar",
            w: 280,
            fun: () async {
              if (productoSelecionado.IdProducto < 1) {
                return;
              }

              productoSelecionado.Descripcion = descripcion.text;
              productoSelecionado.Longitud = longitud.text;
              productoSelecionado.Almacen = almacen.text;

              ProductosController.putProducto(productoSelecionado);

              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text("System Message"),
                    content: Text("Modificado Correctamente"),
                  );
                },
              );

              codigo.text = "";
              descripcion.text = "";
              longitud.text = "";
              almacen.text = "";

              productoSelecionado.IdProducto = 0;
            },
          ),
          space(h: 10),
          BotonBase(
            icon: Icons.delete,
            texto: "Borrar",
            w: 280,
            fun: () {
              if (productoSelecionado.IdProducto < 1) {
                return;
              }
              ProductosController.deleteProducto(productoSelecionado.IdProducto);

              showDialog(
                context: context,
                builder: (context) {
                  return const AlertDialog(
                    title: Text("System Message"),
                    content: Text("Eliminado Correctamente"),
                  );
                },
              );

              codigo.text = "";
              descripcion.text = "";
              longitud.text = "";
              almacen.text = "";

              productoSelecionado.IdProducto = 0;
            },
          ),
          space(h: 10),
          BotonBase(
            icon: Icons.clear,
            texto: "Limpiar",
            w: 280,
            fun: () {
              codigo.text = "";
              descripcion.text = "";
              longitud.text = "";
              almacen.text = "";

              productoSelecionado.IdProducto = 0;
            },
          )
        ],
      ),
    );
  }
}

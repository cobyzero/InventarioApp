import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: BaseVentana(
          fun: Row(
        children: [
          LeftColumn(),
          space(w: 20),
          lineaContainer(w: 2, h: double.infinity),
          space(w: 40),
          Expanded(child: GridBase())
        ],
      )),
    );
  }

  Column LeftColumn() {
    return Column(
      children: [
        Row(
          children: [
            const Text(
              "Detalle Producto",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        space(h: 20),
        MyTextFormField(controller: codigo, text: "Codigo"),
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
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.delete,
          texto: "Borrar",
          w: 280,
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.clear,
          texto: "Limpiar",
          w: 280,
        )
      ],
    );
  }
}

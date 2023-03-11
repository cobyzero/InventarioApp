import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

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
              GridBase(),
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
              onPressed: () {},
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

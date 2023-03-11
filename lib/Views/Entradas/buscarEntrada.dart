import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';

class BuscarEntradaPage extends StatefulWidget {
  const BuscarEntradaPage({super.key});

  @override
  State<BuscarEntradaPage> createState() => _BuscarEntradaPageState();
}

class _BuscarEntradaPageState extends State<BuscarEntradaPage> {
  var numeroDocumento = TextEditingController();
  var fecha = TextEditingController();
  var usuario = TextEditingController();
  var docProveedor = TextEditingController();
  var nombreProveedor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(30),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    "Buscar Entrada",
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
              space(h: 20),
              GridBase(),
              space(h: 30),
              Row(
                children: [
                  Text("Total: 24"),
                  space(w: 550),
                  BotonBase(icon: Icons.picture_as_pdf, texto: "Descargar PDF")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MyTextFormField(controller: fecha, text: "Fecha"),
          space(w: 20),
          MyTextFormField(controller: usuario, text: "Usuario"),
          space(w: 20),
          MyTextFormField(controller: docProveedor, text: "Documento Proveedor"),
          space(w: 20),
          MyTextFormField(controller: nombreProveedor, text: "Nombre Proveedor")
        ],
      ),
    );
  }

  Row Fila1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyTextFormField(controller: numeroDocumento, text: "Numero de Documento"),
        space(w: 20),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 40,
            )),
        space(w: 20),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.cleaning_services_outlined,
              size: 40,
            ))
      ],
    );
  }
}

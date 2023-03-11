import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';

class CargarProductoPage extends StatefulWidget {
  const CargarProductoPage({super.key});

  @override
  State<CargarProductoPage> createState() => _CargarProductoPageState();
}

class _CargarProductoPageState extends State<CargarProductoPage> {
  var archivo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: BaseVentana(
          fun: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Cargar Producto",
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
          Fila1(),
          space(h: 10),
          const Text(
            "Resumen: 6 Productos encontrados",
            style: TextStyle(color: Colors.cyan),
          ),
          space(h: 20),
          BotonBase(
            icon: Icons.download,
            texto: "Descargar Plantilla",
            w: 200,
          ),
          space(h: 20),
          GridBase()
        ],
      )),
    );
  }

  SingleChildScrollView Fila1() {
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
          BotonBase(icon: Icons.upload, texto: "Subir"),
          space(w: 20),
          BotonBase(icon: Icons.sync, texto: "Procesar")
        ],
      ),
    );
  }
}

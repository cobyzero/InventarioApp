import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/dateTimeFormField.dart';
import 'package:inventarioapp/Common/gridBase.dart';

class InventarioPage extends StatefulWidget {
  const InventarioPage({super.key});

  @override
  State<InventarioPage> createState() => _InventarioPageState();
}

class _InventarioPageState extends State<InventarioPage> {
  var fechaInicio = TextEditingController();
  var fechaFin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "Inventario",
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
            lineaContainer(),
            space(h: 20),
            GridBase(),
            space(h: 20),
            BotonBase(icon: Icons.download, texto: "Descargar Excel")
          ],
        ),
      ),
    );
  }

  Row Fila1() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DateTimeFormField(controller: fechaInicio, texto: "Fecha Inicio"),
        space(w: 20),
        DateTimeFormField(controller: fechaFin, texto: "FechaFin"),
        space(w: 20),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 40,
            )),
      ],
    );
  }
}

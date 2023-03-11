import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/baseVentana.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';

class TecnicosPage extends StatefulWidget {
  const TecnicosPage({super.key});

  @override
  State<TecnicosPage> createState() => _TecnicosPageState();
}

class _TecnicosPageState extends State<TecnicosPage> {
  var numeroDocumento = TextEditingController();
  var nombreCompleto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorblanco(),
      body: BaseVentana(
          fun: Row(
        children: [
          leftColumn(),
          space(w: 20),
          lineaContainer(w: 2, h: double.infinity),
          space(w: 40),
          Expanded(child: GridBase())
        ],
      )),
    );
  }

  Column leftColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Detalle Tecnico",
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
        MyTextFormField(controller: numeroDocumento, text: "Numero Documento"),
        space(h: 20),
        MyTextFormField(controller: nombreCompleto, text: "Nombre Completo"),
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

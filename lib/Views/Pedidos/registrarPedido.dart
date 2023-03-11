import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/colors.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Common/gridBase.dart';
import 'package:inventarioapp/Common/textFormField.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RegistrarPedidoPage extends StatefulWidget {
  const RegistrarPedidoPage({super.key});

  @override
  State<RegistrarPedidoPage> createState() => _RegistrarPedidoPageState();
}

List<String> GetList() {
  List<String> list = [];
  for (int i = 0; i < 20; i++) {
    list.add((i * 1000).toString());
  }

  return list;
}

class _RegistrarPedidoPageState extends State<RegistrarPedidoPage> {
  var numDocumento = TextEditingController();
  var fechaRegistro = TextEditingController();
  var docTecnico = TextEditingController();
  var nombreTecnico = TextEditingController();
  var codigoProducto = TextEditingController();
  var descripcionProducto = TextEditingController();
  var cantidad = TextEditingController();
  var precio = TextEditingController();

  String dropdownValue = GetList().first;
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
                    "Registrar Pedido",
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
                  BotonBase(icon: Icons.edit_square, texto: "Guardar Pedido")
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
          Column(
            children: [
              const Text("Presupuesto"),
              comboBoxPresupuesto(),
            ],
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

  DropdownButton<String> comboBoxPresupuesto() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: GetList().map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  SingleChildScrollView Fila2() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextFormField(controller: docTecnico, text: "Doc. Tecnico"),
          space(w: 30),
          MyTextFormField(controller: nombreTecnico, text: "Nombre Tecnico"),
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

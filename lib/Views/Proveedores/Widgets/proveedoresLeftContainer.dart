import 'package:flutter/material.dart';
import 'package:inventarioapp/Common/botonBase.dart';
import 'package:inventarioapp/Common/common.dart';
import 'package:inventarioapp/Models/proveedoresModel.dart';
import 'package:inventarioapp/ViewModels/proveedorController.dart';
import 'package:inventarioapp/Views/Widgets/textFormField.dart';

class ProveedoresLeftContainer extends StatefulWidget {
  const ProveedoresLeftContainer({super.key});

  @override
  State<ProveedoresLeftContainer> createState() => _ProveedoresLeftContainerState();
}

class _ProveedoresLeftContainerState extends State<ProveedoresLeftContainer> {
  ProveedoresModel productoSelecionado = ProveedoresModel(0, "", "");
  var numeroDocumento = TextEditingController();
  var nombreCompleto = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Detalle Proveedor",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () async {
                  cargando(context);
                  setState(() {
                    // data.clear();
                    // numeroDocumento.text = "";
                    // nombreCompleto.text = "";
                  });
                  productoSelecionado.IdProveedor = 0;
                  List<ProveedoresModel> listaTemp = await ProveedorController.getProveedores()
                      .whenComplete(() => Navigator.pop(context));

                  setState(() {
                    // data = listaTemp;
                  });
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
          fun: () {
            if (productoSelecionado.IdProveedor < 1) {
              return;
            }

            productoSelecionado.NumeroDocumento = numeroDocumento.text;
            productoSelecionado.NombreCompleto = nombreCompleto.text;

            ProveedorController.putProducto(productoSelecionado);

            productoSelecionado.IdProveedor = 0;
            numeroDocumento.text = "";
            nombreCompleto.text = "";
          },
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.delete,
          texto: "Borrar",
          w: 280,
          fun: () {
            if (productoSelecionado.IdProveedor < 1) {
              return;
            }
            ProveedorController.deleteProveedor(productoSelecionado.IdProveedor);

            showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("System Message"),
                  content: Text("Eliminado Correctamente"),
                );
              },
            );

            numeroDocumento.text = "";
            nombreCompleto.text = "";

            productoSelecionado.IdProveedor = 0;
          },
        ),
        space(h: 10),
        BotonBase(
          icon: Icons.clear,
          texto: "Limpiar",
          w: 280,
          fun: () {
            numeroDocumento.text = "";
            nombreCompleto.text = "";

            productoSelecionado.IdProveedor = 0;
          },
        )
      ],
    );
  }
}

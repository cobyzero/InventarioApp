import 'dart:convert';

import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/Models/proudctosModel.dart';
import 'package:http/http.dart' as http;

class ProductosController {
  static void setProductosList(List<ProductosModel> lista) async {
    Uri uri = API.getUri(path: "api/cargarProductos");

    String json = jsonEncode(lista);

    await http.post(uri, body: json);
  }

  static Future<int> checkProductoId(String codigo) async {
    Uri uri = API.getUri(path: "api/checkProducto", parameters: {"codigo": codigo});

    http.Response response = await http.get(uri);

    return int.parse(response.body);
  }
}

import 'dart:convert';

import 'package:inventarioapp/ViewModels/API.dart';
import 'package:inventarioapp/Models/productosModel.dart';
import 'package:http/http.dart' as http;

class ProductosController {
  static void setProductosList(List<ProductosModel> lista) async {
    Uri uri = API.getUri(path: "api/cargarProductos");

    List<Map> map = [];

    for (var element in lista) {
      map.add(element.toJson());
    }

    String json = jsonEncode(map);

    await http.post(uri, body: json);
  }

  static Future<int> checkProductoId(String codigo) async {
    Uri uri = API.getUri(path: "api/checkProducto", parameters: {"codigo": codigo});

    http.Response response = await http.get(uri);

    return int.parse(response.body);
  }

  static Future<List<ProductosModel>> getProductos() async {
    Uri uri = API.getUri(path: "api/getProductos");

    http.Response response = await http.get(uri);

    List<ProductosModel> posts =
        (jsonDecode(response.body) as List).map((e) => ProductosModel.fromJson(e)).toList();

    return posts;
  }

  static void putProducto(ProductosModel producto) async {
    Uri uri = API.getUri(path: "api/putProducto");

    String json = jsonEncode(producto.toJson());
    await http.put(uri, body: json);
  }

  static void deleteProducto(int id) async {
    Uri uri = API.getUri(path: "api/deleteProducto", parameters: {"id": id.toString()});

    await http.delete(uri);
  }
}

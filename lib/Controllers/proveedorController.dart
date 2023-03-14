import 'dart:convert';

import 'package:inventarioapp/Controllers/API.dart';
import 'package:http/http.dart' as http;
import 'package:inventarioapp/Models/proveedoresModel.dart';

class ProveedorController {
  static getProveedores() async {
    Uri uri = API.getUri(path: "api/getProveedor");
    http.Response response = await http.get(uri);

    List<ProveedoresModel> posts =
        (jsonDecode(response.body) as List).map((e) => ProveedoresModel.fromJson(e)).toList();

    return posts;
  }

  static void putProducto(ProveedoresModel producto) async {
    Uri uri = API.getUri(path: "api/putProveedor");

    String json = jsonEncode(producto.toJson());
    await http.put(uri, body: json);
  }

  static void deleteProveedor(int id) async {
    Uri uri = API.getUri(path: "api/deleteProveedor", parameters: {"id": id.toString()});

    await http.delete(uri);
  }
}

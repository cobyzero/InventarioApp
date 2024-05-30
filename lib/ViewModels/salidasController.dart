import 'dart:convert';

import 'package:inventarioapp/Features/Auth/Domain/Entitys/user_entity.dart';
import 'package:inventarioapp/ViewModels/API.dart';
import 'package:inventarioapp/Models/salidasModel.dart';
import 'package:http/http.dart' as http;

class SalidasController {
  static Future<List<UserEntity>> getTecnicos() async {
    Uri uri = API.getUri(path: "api/getUsuario");

    http.Response response = await http.get(uri);

    List<UserEntity> posts =
        (jsonDecode(response.body) as List).map((e) => UserEntity.fromJson(e)).toList();

    return posts;
  }

  static addSalida(List<SalidasModel> data) async {
    Uri uri = API.getUri(path: "api/addSalida");
    List<Map> map = [];

    for (var element in data) {
      map.add(element.toJson());
    }

    String json = jsonEncode(map);

    await http.post(uri, body: json);
  }

  static Future<List<SalidasModel>> getSalidaForDocumento(String documento) async {
    Uri uri = API.getUri(path: "api/getSalidaForDocumento", parameters: {"documento": documento});

    if (documento.isEmpty) {
      return [];
    }
    http.Response response = await http.get(uri);

    List<SalidasModel> posts =
        (jsonDecode(response.body) as List).map((e) => SalidasModel.fromJson(e)).toList();

    return posts;
  }

  static Future<List<SalidasModel>> getSalidaForProducto(int id) async {
    Uri uri = API.getUri(path: "api/getSalidaForProducto", parameters: {"id": id.toString()});

    http.Response response = await http.get(uri);

    List<SalidasModel> posts =
        (jsonDecode(response.body) as List).map((e) => SalidasModel.fromJson(e)).toList();

    return posts;
  }

  static Future<List<SalidasModel>> getSalidas() async {
    Uri uri = API.getUri(path: "api/getSalida");

    http.Response response = await http.get(uri);

    List<SalidasModel> posts =
        (jsonDecode(response.body) as List).map((e) => SalidasModel.fromJson(e)).toList();

    return posts;
  }

  static void putTecnico(UserEntity producto) async {
    Uri uri = API.getUri(path: "api/putUser");

    String json = jsonEncode(producto.toJson());
    await http.put(uri, body: json);
  }

  static void deleteTecnico(int id) async {
    Uri uri = API.getUri(path: "api/deleteUser", parameters: {"id": id.toString()});

    await http.delete(uri);
  }
}

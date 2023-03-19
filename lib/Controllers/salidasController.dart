import 'dart:convert';

import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/Models/salidasModel.dart';
import 'package:inventarioapp/Models/tecnicosModel.dart';
import 'package:http/http.dart' as http;

class SalidasController {
  static Future<List<TecnicoModel>> getTecnicos() async {
    Uri uri = API.getUri(path: "api/getTecnico");

    http.Response response = await http.get(uri);

    List<TecnicoModel> posts =
        (jsonDecode(response.body) as List).map((e) => TecnicoModel.fromJson(e)).toList();

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
}

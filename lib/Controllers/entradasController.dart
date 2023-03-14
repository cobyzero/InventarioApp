import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/Controllers/API.dart';
import 'package:inventarioapp/Models/entradasModel.dart';

class EntradasController {
  static addEntrada(List<EntradasModel> data) async {
    Uri uri = API.getUri(path: "api/addEntrada");
    List<Map> map = [];

    for (var element in data) {
      map.add(element.toJson());
    }

    String json = jsonEncode(map);

    await http.post(uri, body: json);
  }

  static getEntradaForDocumento(String documento) async {
    Uri uri = API.getUri(path: "api/getEntradaForDocumento", parameters: {"documento": documento});

    http.Response response = await http.get(uri);

    List<EntradasModel> posts =
        (jsonDecode(response.body) as List).map((e) => EntradasModel.fromJson(e)).toList();

    return posts;
  }
}

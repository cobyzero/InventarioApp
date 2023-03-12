import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/Controllers/API.dart';

class MainController {
  static Future<List<String>> getResquestEntradasCount() async {
    var uri = API.getUri(path: "api/count");

    http.Response response = await http.get(uri);

    String listaS = response.body;

    String listo = listaS.replaceAll("[", "").replaceAll("]", "");

    List<String> list = listo.split(",");

    return list;
  }
}

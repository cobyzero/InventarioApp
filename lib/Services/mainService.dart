import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:inventarioapp/Common/GraficoBase2.dart';
import 'package:inventarioapp/ViewModels/API.dart';
import 'package:inventarioapp/Models/permisosModel.dart';
import 'package:inventarioapp/Models/productosModel.dart';

class MainService {
  static Future<Map> getResquestEntradasCount() async {
    var uri = API.getUri(path: "api/count");

    http.Response response = await http.get(uri);

    Map map = jsonDecode(response.body);

    return map;
  }

  static Future<List<ProductosModel>> getProductosStock(int max) async {
    var uri = API.getUri(path: "api/getProductosStock", parameters: {"max": max.toString()});

    http.Response response = await http.get(uri);

    List<ProductosModel> posts =
        (jsonDecode(response.body) as List).map((e) => ProductosModel.fromJson(e)).toList();

    return posts;
  }

  static Future<List<List<SalesData>>> getGraficoEntradas() async {
    var uri = API.getUri(path: "api/getGraficoEntradas");

    http.Response response = await http.get(uri);

    List<SalesData> posts =
        (jsonDecode(response.body) as List).map((e) => SalesData.fromJson(e)).toList();

    var uriSalidas = API.getUri(path: "api/getGraficoSalidas");

    http.Response responseSalidas = await http.get(uriSalidas);

    List<SalesData> salidas =
        (jsonDecode(responseSalidas.body) as List).map((e) => SalesData.fromJson(e)).toList();

    List<List<SalesData>> data = [];

    data.add(posts);
    data.add(salidas);

    return data;
  }

  static Future<PermisosModel> getPermisos(int id) async {
    Uri uri = API.getUri(path: "api/getPermisos", parameters: {"id": id.toString()});

    http.Response response = await http.get(uri);

    PermisosModel permisosModel = PermisosModel.fromJson(jsonDecode(response.body));

    if (permisosModel.idPermisos == 0) {
      return PermisosModel(idPermisos: 0);
    }
    return permisosModel;
  }
}

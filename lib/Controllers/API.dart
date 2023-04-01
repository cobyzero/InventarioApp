import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class API {
  static String webProduc = "www.eAlemana.somee.com";
  static String web = "localhost";

  static int port = 7010;

  static Uri getUri({required String path, Map<String, dynamic>? parameters}) {
    return Uri(scheme: "http", host: API.webProduc, path: path, queryParameters: parameters);
  }

  static checkServer(BuildContext context) async {
    Uri uri = getUri(path: "server");

    try {
      await http.get(uri);
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text("No se pudo conectar con el servidor, Vuelva a intentarlo."),
          );
        },
      ).whenComplete(() => exit(0));
    }
  }
}

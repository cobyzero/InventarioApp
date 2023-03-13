class API {
  static String web = "ealemana.somee.com";
  static int port = 7010;

  static Uri getUri({required String path, Map<String, dynamic>? parameters}) {
    return Uri(scheme: "http", host: API.web, path: path, queryParameters: parameters);
  }
}

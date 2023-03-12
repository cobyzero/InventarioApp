class API {
  static String web = "localhost";
  static int port = 7010;

  static Uri getUri({required String path, Map<String, dynamic>? parameters}) {
    return Uri(port: port, scheme: "https", host: API.web, path: path, queryParameters: parameters);
  }
}

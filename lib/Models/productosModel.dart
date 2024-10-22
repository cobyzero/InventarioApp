class ProductosModel {
  int idProducto;
  String codigo;
  String descripcion;
  String longitud;
  String almacen;
  int stock;
  ProductosModel({
    required this.idProducto,
    required this.codigo,
    required this.descripcion,
    required this.longitud,
    required this.almacen,
    required this.stock,
  });

  Map<String, dynamic> toJson() => {
        'IdProducto': idProducto,
        'Codigo': codigo,
        'Descripcion': descripcion,
        'Longitud': longitud,
        'Almacen': almacen,
        'Stock': stock
      };

  static ProductosModel fromJson(json) {
    ProductosModel p = ProductosModel(
      idProducto: json["idProducto"],
      codigo: json["codigo"],
      descripcion: json["descripcion"],
      longitud: json["longitud"],
      almacen: json["almacen"],
      stock: json["stock"],
    );
    return p;
  }
}

class ProductosModel {
  int IdProducto;
  String Codigo;
  String Descripcion;
  String Longitud;
  String Almacen;
  int Stock;
  ProductosModel(
      this.IdProducto, this.Codigo, this.Descripcion, this.Longitud, this.Almacen, this.Stock);

  Map<String, dynamic> toJson() => {
        'IdProducto': IdProducto,
        'Codigo': Codigo,
        'Descripcion': Descripcion,
        'Longitud': Longitud,
        'Almacen': Almacen,
        'Stock': Stock
      };

  static ProductosModel fromJson(json) {
    ProductosModel p = ProductosModel(json["idProducto"], json["codigo"], json["descripcion"],
        json["longitud"], json["almacen"], json["stock"]);
    return p;
  }
}

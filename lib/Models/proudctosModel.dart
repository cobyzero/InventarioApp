class ProductosModel {
  int IdProducto;
  String Codigo;
  String Descripcion;
  String Longitud;
  String Almacen;
  int Stock;
  int existe;
  ProductosModel(this.IdProducto, this.Codigo, this.Descripcion, this.Longitud, this.Almacen,
      this.Stock, this.existe);

  Map<String, dynamic> toJson() => {
        'Codigo': Codigo,
        'Descripcion': Descripcion,
        'Longitud': Longitud,
        'Almacen': Almacen,
        'Stock': Stock
      };
}

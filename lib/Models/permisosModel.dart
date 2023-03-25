class PermisosModel {
  int? idPermisos;
  String? descripcion;
  int? salidas;
  int? entradas;
  int? productos;
  int? proveedores;
  int? inventario;
  int? configuracion;

  PermisosModel(
      {this.idPermisos,
      this.descripcion,
      this.salidas,
      this.entradas,
      this.productos,
      this.proveedores,
      this.inventario,
      this.configuracion});

  PermisosModel.fromJson(Map<String, dynamic> json) {
    idPermisos = json['idPermisos'];
    descripcion = json['descripcion'];
    salidas = json['salidas'];
    entradas = json['entradas'];
    productos = json['productos'];
    proveedores = json['proveedores'];
    inventario = json['inventario'];
    configuracion = json['configuracion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idPermisos'] = this.idPermisos;
    data['descripcion'] = this.descripcion;
    data['salidas'] = this.salidas;
    data['entradas'] = this.entradas;
    data['productos'] = this.productos;
    data['proveedores'] = this.proveedores;
    data['inventario'] = this.inventario;
    data['configuracion'] = this.configuracion;
    return data;
  }
}

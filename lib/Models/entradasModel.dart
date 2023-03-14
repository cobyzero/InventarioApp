class EntradasModel {
  int? idEntrada;
  String? numeroDocumento;
  String? fechaRegistro;
  String? usuarioRegistro;
  String? documentoProveedor;
  String? nombreProveedor;
  int? cantidadProductos;
  int? idProducto;
  String? codigoProducto;
  String? descripcionProducto;
  String? longitudProducto;
  String? almacenProducto;

  EntradasModel(
      this.idEntrada,
      this.numeroDocumento,
      this.fechaRegistro,
      this.usuarioRegistro,
      this.documentoProveedor,
      this.nombreProveedor,
      this.cantidadProductos,
      this.idProducto,
      this.codigoProducto,
      this.descripcionProducto,
      this.longitudProducto,
      this.almacenProducto);

  EntradasModel.fromJson(Map<String, dynamic> json) {
    idEntrada = json['idEntrada'];
    numeroDocumento = json['numeroDocumento'];
    fechaRegistro = json['fechaRegistro'];
    usuarioRegistro = json['usuarioRegistro'];
    documentoProveedor = json['documentoProveedor'];
    nombreProveedor = json['nombreProveedor'];
    cantidadProductos = json['cantidadProductos'];
    idProducto = json['idProducto'];
    codigoProducto = json['codigoProducto'];
    descripcionProducto = json['descripcionProducto'];
    longitudProducto = json['longitudProducto'];
    almacenProducto = json['almacenProducto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdEntrada'] = this.idEntrada;
    data['NumeroDocumento'] = this.numeroDocumento;
    data['FechaRegistro'] = this.fechaRegistro;
    data['UsuarioRegistro'] = this.usuarioRegistro;
    data['DocumentoProveedor'] = this.documentoProveedor;
    data['NombreProveedor'] = this.nombreProveedor;
    data['CantidadProductos'] = this.cantidadProductos;
    data['IdProducto'] = this.idProducto;
    data['CodigoProducto'] = this.codigoProducto;
    data['DescripcionProducto'] = this.descripcionProducto;
    data['LongitudProducto'] = this.longitudProducto;
    data['AlmacenProducto'] = this.almacenProducto;
    return data;
  }
}

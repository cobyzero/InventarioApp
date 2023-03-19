class SalidasModel {
  int? idSalida;
  String? numeroDocumento;
  String? fechaRegistro;
  String? usuarioRegistro;
  String? documentoCliente;
  String? nombreCliente;
  int? cantidadProductos;
  int? idProducto;
  String? codigoProducto;
  String? descripcionProducto;
  String? longitudProducto;
  String? almacenProducto;

  SalidasModel(
      {this.idSalida,
      this.numeroDocumento,
      this.fechaRegistro,
      this.usuarioRegistro,
      this.documentoCliente,
      this.nombreCliente,
      this.cantidadProductos,
      this.idProducto,
      this.codigoProducto,
      this.descripcionProducto,
      this.longitudProducto,
      this.almacenProducto});

  SalidasModel.fromJson(Map<String, dynamic> json) {
    idSalida = json['idSalida'];
    numeroDocumento = json['numeroDocumento'];
    fechaRegistro = json['fechaRegistro'];
    usuarioRegistro = json['usuarioRegistro'];
    documentoCliente = json['documentoCliente'];
    nombreCliente = json['nombreCliente'];
    cantidadProductos = json['cantidadProductos'];
    idProducto = json['idProducto'];
    codigoProducto = json['codigoProducto'];
    descripcionProducto = json['descripcionProducto'];
    longitudProducto = json['longitudProducto'];
    almacenProducto = json['almacenProducto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdSalida'] = this.idSalida;
    data['NumeroDocumento'] = this.numeroDocumento;
    data['FechaRegistro'] = this.fechaRegistro;
    data['UsuarioRegistro'] = this.usuarioRegistro;
    data['DocumentoCliente'] = this.documentoCliente;
    data['NombreCliente'] = this.nombreCliente;
    data['CantidadProductos'] = this.cantidadProductos;
    data['IdProducto'] = this.idProducto;
    data['CodigoProducto'] = this.codigoProducto;
    data['DescripcionProducto'] = this.descripcionProducto;
    data['LongitudProducto'] = this.longitudProducto;
    data['AlmacenProducto'] = this.almacenProducto;
    return data;
  }
}

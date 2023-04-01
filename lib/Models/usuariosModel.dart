class UsuariosModel {
  int? idUsuario;
  String? nombreCompleto;
  String? nombreUsuario;
  String? numeroDocumento;
  String? clave;
  int? idPermisos;

  UsuariosModel(
      {this.idUsuario,
      this.nombreCompleto,
      this.nombreUsuario,
      this.numeroDocumento,
      this.clave,
      this.idPermisos});

  UsuariosModel.fromJson(Map<String, dynamic> json) {
    idUsuario = json['idUsuario'];
    nombreCompleto = json['nombreCompleto'];
    nombreUsuario = json['nombreUsuario'];
    numeroDocumento = json['numeroDocumento'];
    clave = json['clave'];
    idPermisos = json['idPermisos'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['IdUsuario'] = this.idUsuario;
    data['NombreCompleto'] = this.nombreCompleto;
    data['NombreUsuario'] = this.nombreUsuario;
    data['NumeroDocumento'] = this.numeroDocumento;
    data['Clave'] = this.clave;
    data['IdPermisos'] = this.idPermisos;
    return data;
  }
}

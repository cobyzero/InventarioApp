class UsuariosModel {
  int IdUsuario;
  String NombreComplet;
  String NombreUsuario;
  String NumeroDocumento;
  String Clave;
  int IdPermisos;

  UsuariosModel(this.IdUsuario, this.NombreComplet, this.NombreUsuario, this.NumeroDocumento,
      this.Clave, this.IdPermisos);

  UsuariosModel.fromJson(Map<String, dynamic> json)
      : IdUsuario = json["idUsuario"],
        NombreComplet = json["nombreCompleto"],
        NombreUsuario = json["nombreUsuario"],
        NumeroDocumento = json["numeroDocumento"],
        Clave = json["clave"],
        IdPermisos = json["idPermisos"];
}

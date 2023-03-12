class UsuariosModel {
  int IdUsuario;
  String NombreComplet;
  String NombreUsuario;
  String Clave;
  int IdPermisos;

  UsuariosModel(
      this.IdUsuario, this.NombreComplet, this.NombreUsuario, this.Clave, this.IdPermisos);

  UsuariosModel.fromJson(Map<String, dynamic> json)
      : IdUsuario = json["IdUsuario"],
        NombreComplet = json["NombreCompleto"],
        NombreUsuario = json["NombreUsuario"],
        Clave = json["Clave"],
        IdPermisos = json["IdPermisos"];
}

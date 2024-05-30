class UserEntity {
  final int idUsuario;
  final String nombreCompleto;
  final String nombreUsuario;
  final String numeroDocumento;
  final String clave;
  final int idPermisos;

  UserEntity({
    required this.idUsuario,
    required this.nombreCompleto,
    required this.nombreUsuario,
    required this.numeroDocumento,
    required this.clave,
    required this.idPermisos,
  });

  UserEntity copyWith({
    int? idUsuario,
    String? nombreCompleto,
    String? nombreUsuario,
    String? numeroDocumento,
    String? clave,
    int? idPermisos,
  }) =>
      UserEntity(
        idUsuario: idUsuario ?? this.idUsuario,
        nombreCompleto: nombreCompleto ?? this.nombreCompleto,
        nombreUsuario: nombreUsuario ?? this.nombreUsuario,
        numeroDocumento: numeroDocumento ?? this.numeroDocumento,
        clave: clave ?? this.clave,
        idPermisos: idPermisos ?? this.idPermisos,
      );

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      idUsuario: json["idUsuario"],
      nombreCompleto: json["nombreCompleto"],
      nombreUsuario: json["nombreUsuario"],
      numeroDocumento: json["numeroDocumento"],
      clave: json["clave"],
      idPermisos: json["idPermisos"],
    );
  }

  Map<String, dynamic> toJson() => {
        "idUsuario": idUsuario,
        "nombreCompleto": nombreCompleto,
        "nombreUsuario": nombreUsuario,
        "numeroDocumento": numeroDocumento,
        "clave": clave,
        "idPermisos": idPermisos,
      };
}

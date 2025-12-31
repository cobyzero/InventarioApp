class ProveedoresModel {
  int IdProveedor;
  String NumeroDocumento;
  String NombreCompleto;

  ProveedoresModel(this.IdProveedor, this.NumeroDocumento, this.NombreCompleto);

  Map<String, dynamic> toJson() => {
        'IdProveedor': IdProveedor,
        'NumeroDocumento': NumeroDocumento,
        'NombreCompleto': NombreCompleto,
      };

  static ProveedoresModel fromJson(json) {
    ProveedoresModel p =
        ProveedoresModel(json["idProveedor"], json["numeroDocumento"], json["nombreCompleto"]);
    return p;
  }
}

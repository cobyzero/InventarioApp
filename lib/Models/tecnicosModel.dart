class TecnicoModel {
  int? idCliente;
  String? numeroDocumento;
  String? nombreCompleto;

  TecnicoModel({this.idCliente, this.numeroDocumento, this.nombreCompleto});

  TecnicoModel.fromJson(Map<String, dynamic> json) {
    idCliente = json['idCliente'];
    numeroDocumento = json['numeroDocumento'];
    nombreCompleto = json['nombreCompleto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCliente'] = this.idCliente;
    data['numeroDocumento'] = this.numeroDocumento;
    data['nombreCompleto'] = this.nombreCompleto;
    return data;
  }
}

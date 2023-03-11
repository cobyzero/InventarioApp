class Salidas {
  int idSalida;
  String NumeroDocumento;
  DateTime FechaRegistro;
  String UsuarioRegistro;
  String DocumentoCliente;
  String NombreCliente;
  int CantidadProductos;
  int IdProducto;
  String CodigoProducto;
  String DescripcionProducto;
  String LongitudProducto;
  String AlmacenProducto;

  Salidas(
      {required this.idSalida,
      required this.NumeroDocumento,
      required this.FechaRegistro,
      required this.UsuarioRegistro,
      required this.DocumentoCliente,
      required this.NombreCliente,
      required this.CantidadProductos,
      required this.IdProducto,
      required this.CodigoProducto,
      required this.DescripcionProducto,
      required this.LongitudProducto,
      required this.AlmacenProducto});
}

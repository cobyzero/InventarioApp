class EntradasModel {
  int IdEntrada;
  String NumeroDocumento;
  DateTime FechaRegistro;
  String UsuarioRegistro;
  String DocumentoProveedor;
  String NombreProveedor;
  int CantidadProductos;
  int IdProducto;
  String CodigoProducto;
  String DescripcionProducto;
  String LongitudProducto;
  String AlmacenProducto;

  EntradasModel(
      this.IdEntrada,
      this.NumeroDocumento,
      this.FechaRegistro,
      this.UsuarioRegistro,
      this.DocumentoProveedor,
      this.NombreProveedor,
      this.CantidadProductos,
      this.IdProducto,
      this.CodigoProducto,
      this.DescripcionProducto,
      this.LongitudProducto,
      this.AlmacenProducto);
}

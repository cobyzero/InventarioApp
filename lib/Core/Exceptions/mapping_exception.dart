import 'package:inventarioapp/Core/Exceptions/iexception.dart';

class MappingException extends IException {
  MappingException() : super(error: "Error al mapear los datos");
}

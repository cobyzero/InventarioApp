import 'package:inventarioapp/Models/usuariosModel.dart';

class LocalData {
  static UsuariosModel? userLocal;

  static void clearData() {
    userLocal = null;
  }
}

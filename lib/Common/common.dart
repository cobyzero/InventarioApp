import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

space({double h = 0, double w = 0}) {
  return SizedBox(
    height: h,
    width: w,
  );
}

fechaHoy() {
  return "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
}

lineaContainer({double w = double.infinity, double h = 2}) {
  return Container(
    width: w,
    height: h,
    color: Colors.grey[300],
    margin: EdgeInsets.only(top: 10, bottom: 10),
  );
}

alertMensaje(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(content: Text(message));
    },
  );
}

errorAlertMessage(BuildContext context, String? error) {
  QuickAlert.show(
    barrierDismissible: false,
    context: context,
    type: QuickAlertType.error,
    text: error,
  );
}

Future<void> successAlertMessage(BuildContext context, String? message) async {
  await QuickAlert.show(
    barrierDismissible: false,
    context: context,
    type: QuickAlertType.success,
    text: message,
    showConfirmBtn: false,
    autoCloseDuration: const Duration(seconds: 2),
  );
}

cargando(BuildContext context) {
  QuickAlert.show(
    barrierDismissible: false,
    context: context,
    type: QuickAlertType.loading,
  );
}

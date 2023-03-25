import 'package:flutter/material.dart';

space({double h = 0, double w = 0}) {
  return SizedBox(
    height: h,
    width: w,
  );
}

fechaHoy() {
  return "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}";
}

lineaContainer({double w: double.infinity, double h = 2}) {
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

cargando(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: SizedBox(
          width: 100,
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const Text("Loading.."), space(h: 10), const CircularProgressIndicator()],
          ),
        ),
      );
    },
  );
}

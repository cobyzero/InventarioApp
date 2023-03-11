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

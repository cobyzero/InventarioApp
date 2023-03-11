import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  MyTextFormField(
      {super.key,
      required this.controller,
      required this.text,
      this.w = 280,
      this.type = TextInputType.text,
      this.defaultText = ""});

  TextEditingController controller;
  String text;
  double w;
  TextInputType type;
  String defaultText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          labelText: text,
          hintText: defaultText,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}

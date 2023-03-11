import 'package:flutter/material.dart';

class DateTimeFormField extends StatelessWidget {
  DateTimeFormField({super.key, required this.controller, required this.texto});
  TextEditingController controller;
  String texto;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: texto,
        ),
        onTap: () async {
          DateTime? date = DateTime(1900);
          FocusScope.of(context).requestFocus(FocusNode());

          date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100));

          controller.text = date!.toIso8601String();
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/core/util/palette.dart';
import 'package:inventarioapp/core/util/shadows.dart';
import 'package:sizer/sizer.dart';

class MyTextFormField extends StatefulWidget {
  const MyTextFormField({
    super.key,
    required this.text,
    this.controller,
    this.obscureText = false,
    this.readOnliny = false,
    this.type,
  });

  final String text;
  final TextEditingController? controller;
  final bool readOnliny;
  final bool obscureText;
  final TextInputType? type;

  @override
  State<StatefulWidget> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Palette.white,
        boxShadow: [
          Shadows.dropShadow(
            x: 0,
            y: 4,
            blurRadius: 14,
            opacity: .12,
          ),
        ],
        borderRadius: BorderRadius.circular(22.sp),
      ),
      child: TextFormField(
        keyboardType: widget.type,
        readOnly: widget.readOnliny,
        controller: widget.controller,
        obscureText: widget.obscureText,
        decoration: InputDecoration(
          hintText: widget.text,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
          ),
          contentPadding: EdgeInsets.only(
            left: 5.w,
            top: 1.4.h,
            bottom: 1.4.h,
          ),
          hintStyle: const TextStyle(
            color: Palette.whiteOpacity,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

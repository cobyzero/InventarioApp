import 'package:flutter/material.dart';
import 'package:inventarioapp/core/util/palette.dart';
import 'package:inventarioapp/core/util/texts.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
  });

  final String text;
  final Function() onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Palette.kPrimary,
        minimumSize: Size(double.infinity, 4.5.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.sp),
        ),
      ),
      onPressed: onPressed,
      child: Texts.regular(
        text.toUpperCase(),
        color: Palette.white,
        fontSize: 8,
      ),
    );
  }
}

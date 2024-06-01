import 'package:flutter/material.dart';
import 'package:inventarioapp/core/util/palette.dart';
import 'package:sizer/sizer.dart';

class Texts extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign alignment;
  final FontWeight fontWeight;
  final bool underline;
  final Color color;
  final double height;
  final int maxLines;
  final EdgeInsetsGeometry? padding;
  final TextOverflow textOverflow;
  final double? letterSpacing;
  final void Function()? onTap;
  final TextStyle? style;
  final String? fontFamily;

  const Texts(
    this.text, {
    super.key,
    this.fontSize = 15,
    required this.fontWeight,
    this.underline = false,
    this.alignment = TextAlign.left,
    this.height = 1,
    this.maxLines = 30,
    this.textOverflow = TextOverflow.clip,
    required this.color,
    this.padding,
    this.style,
    this.letterSpacing,
    this.onTap,
    this.fontFamily,
  });

  const Texts.bold(
    this.text, {
    super.key,
    this.height = 1,
    this.fontSize = 15,
    this.fontFamily,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.letterSpacing,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.bold;
  const Texts.w300(
    this.text, {
    super.key,
    this.height = 1,
    this.fontFamily,
    this.fontSize = 15,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.letterSpacing,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w300;
  const Texts.w400(
    this.text, {
    super.key,
    this.height = 1,
    this.fontFamily,
    this.fontSize = 15,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.letterSpacing,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w400;

  const Texts.w500(
    this.text, {
    super.key,
    this.height = 1,
    this.fontSize = 15,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.letterSpacing,
    this.maxLines = 30,
    this.fontFamily,
    this.textOverflow = TextOverflow.clip,
    this.color = Palette.black,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w500;
  const Texts.w600(
    this.text, {
    super.key,
    this.height = 1,
    this.fontSize = 15,
    this.fontFamily,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.letterSpacing,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w600;

  const Texts.w700(
    this.text, {
    super.key,
    this.height = 1,
    this.fontSize = 15,
    this.letterSpacing,
    this.fontFamily,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w700;

  const Texts.regular(
    this.text, {
    super.key,
    this.height = 1,
    this.fontSize = 15,
    this.fontFamily,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.letterSpacing,
    this.textOverflow = TextOverflow.clip,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.normal;

  const Texts.w800(
    this.text, {
    super.key,
    this.height = 1,
    this.fontFamily,
    this.fontSize = 15,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.textOverflow = TextOverflow.clip,
    this.letterSpacing,
    this.padding,
    this.style,
    this.onTap,
  }) : fontWeight = FontWeight.w800;

  const Texts.w900(
    this.text, {
    super.key,
    this.height = 1,
    this.letterSpacing,
    this.fontSize = 14,
    this.alignment = TextAlign.left,
    this.underline = false,
    this.color = Palette.black,
    this.maxLines = 30,
    this.fontFamily,
    this.textOverflow = TextOverflow.clip,
    this.style,
    this.padding,
    this.onTap,
  }) : fontWeight = FontWeight.w900;

  static String hideEmailFunction(String text) {
    final aux = text.split("@");
    return "${aux[0][0]}*******${aux[0][aux.length - 1]}@${aux[1]}";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          textAlign: alignment,
          style: TextStyle(
            color: color,
            fontSize: fontSize.sp,
            height: height,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            fontFamily: fontFamily ?? "Poppins",
            decoration:
                underline ? TextDecoration.underline : TextDecoration.none,
          ),
          maxLines: maxLines,
          overflow: textOverflow,
          softWrap: true,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:inventarioapp/core/util/palette.dart';

class Shadows {
  static BoxShadow dropShadow({
    required double x,
    required double y,
    required double blurRadius,
    required double opacity,
    double spreadRadius = 0,
  }) {
    return BoxShadow(
      offset: Offset(x, y),
      spreadRadius: spreadRadius,
      color: Palette.black.withOpacity(opacity),
      blurRadius: blurRadius,
    );
  }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inventarioapp/core/util/palette.dart';
import 'package:inventarioapp/core/util/texts.dart';
import 'package:sizer/sizer.dart';

class BotonMenuItem extends StatelessWidget {
  const BotonMenuItem({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    required this.isOpen,
    required this.isSelected,
  });

  final String text;
  final IconData icon;
  final Function() onTap;
  final bool isOpen;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: isOpen ? 4.w : 2.w),
      shape: const StadiumBorder(),
      tileColor: isOpen
          ? isSelected
              ? Palette.black
              : Palette.black.withOpacity(.4)
          : Colors.transparent,
      hoverColor: Palette.grey,
      onFocusChange: (value) {
        log(value.toString());
      },
      onTap: onTap,
      title: isOpen
          ? AnimatedOpacity(
              opacity: isOpen ? 1 : 0,
              duration: const Duration(milliseconds: 1),
              child: Texts.bold(
                text,
                fontSize: 8,
                color: Palette.greyBlack,
              ),
            )
          : null,
      leading: Icon(
        icon,
        color: isOpen
            ? Palette.greyBlack
            : isSelected
                ? Palette.black
                : Palette.greyBlack,
      ),
    ).marginSymmetric(vertical: .5.h, horizontal: isOpen ? 4.w : 0);
  }
}

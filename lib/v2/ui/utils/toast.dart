import 'package:easy_padding/extentions/padding_extentions.dart';
import 'package:flutter/material.dart';
import 'package:inventarioapp/v2/ui/utils/utils.dart';

extension ToastExtension on BuildContext {
  static OverlayEntry? _overlayEntry;

  void show(String message) {
    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          ModalBarrier(
              dismissible: false, color: Colors.black.withOpacity(0.3)),
          Center(
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Texts.bold(
                    message,
                    fontSize: 15,
                  ).only(bottom: 4.h),
                  ElevatedButton(
                    onPressed: () {
                      hide();
                    },
                    child: const Texts.regular("Aceptar"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(this).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

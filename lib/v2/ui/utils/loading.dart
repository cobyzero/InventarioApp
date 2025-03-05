import 'package:flutter/material.dart';
import 'package:inventarioapp/v2/ui/utils/utils.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context) {
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          child: const CircularProgressIndicator(
                            color: Palette.primary,
                            backgroundColor: Palette.white,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      const Texts.bold(
                        "Please Wait...",
                        fontSize: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

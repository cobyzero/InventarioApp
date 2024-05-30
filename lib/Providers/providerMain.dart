import 'package:flutter/material.dart';

class ProviderMain extends ChangeNotifier {
  bool _activeView = true;

  bool get activeView => _activeView;

  set activeView(bool a) {
    _activeView = a;
    notifyListeners();
  }
}

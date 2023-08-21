import 'package:flutter/material.dart';

enum MenuStatus {
  open,
  closed,
  blur,
}

class MenuDropController extends ValueNotifier<MenuStatus> {
  MenuDropController({MenuStatus? state}) : super(state ?? MenuStatus.closed);

  bool get isOpen => value == MenuStatus.open;

  void open() {
    value = MenuStatus.open;
    notifyListeners();
  }

  void close() {
    value = MenuStatus.closed;
    notifyListeners();
  }

  void blur(bool blu) {
    if (blu) {
      if (value != MenuStatus.blur) {
        value = MenuStatus.blur;
        notifyListeners();
      }
    } else if (value != MenuStatus.closed) {
      value = MenuStatus.closed;
      notifyListeners();
    }
  }

  void toggle() {
    value = value == MenuStatus.open ? MenuStatus.closed : MenuStatus.open;
    notifyListeners();
  }
}

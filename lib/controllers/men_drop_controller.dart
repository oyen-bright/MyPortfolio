import 'package:flutter/material.dart';

class MenuDropController extends ValueNotifier<bool> {
  MenuDropController({bool? state}) : super(state ?? false);

  bool get isOpen => value;

  void open() {
    value = true;
    notifyListeners();
  }

  void close() {
    value = false;
    notifyListeners();
  }

  void toggle() {
    value = !value;
    notifyListeners();
  }
}

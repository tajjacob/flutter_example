import 'package:flutter/material.dart';

class Foo extends ChangeNotifier {
  String value = 'Foo';

  void changeValue() {
    value = value == 'Bar' ? 'Foo' : 'Bar';
    notifyListeners();
  }
}

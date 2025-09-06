import 'package:flutter/material.dart';

class PriorityProvider extends ChangeNotifier {
  int _priority = 0;

  int get priority => _priority;

  void setPriority(int value) {
    _priority = value;
    notifyListeners();
  }
}

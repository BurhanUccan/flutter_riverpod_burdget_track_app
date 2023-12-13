import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final textControllerProvider = ChangeNotifierProvider((ref) {
  return MyTextControllerProvider();
});

class MyTextControllerProvider with ChangeNotifier {
  TextEditingController _textController = TextEditingController();

  TextEditingController get textController => _textController;

  void updateText(String newText) {
    _textController.text = newText;
    notifyListeners();
  }
}

import 'package:flutter/foundation.dart';

class TextModel extends ChangeNotifier {

  String _text = 'Lucas';

  String get text => _text;

  void setText(String text) {
    _text = text;
    // Notify the changes to the listeners
    notifyListeners();
  }

}
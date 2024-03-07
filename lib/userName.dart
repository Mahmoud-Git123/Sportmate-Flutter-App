import 'package:flutter/widgets.dart';

class UsernameProvider with ChangeNotifier {
  String _username = '';

  String get username => _username;

  set username(String value) {
    _username = value;
    notifyListeners();
  }
}
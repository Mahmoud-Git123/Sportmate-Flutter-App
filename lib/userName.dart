import 'package:flutter/widgets.dart';
import 'package:sportsmate_flutter/DbHelper.dart';

class UsernameProvider with ChangeNotifier {
  String _username = '';
  String _email = '';

  String get username => _username;
  String get email => _email;

  set username(String value) {
    _username = value;
    fetchEmail(value);
    notifyListeners();
  }

  Future<void> fetchEmail(String username) async {
    DbHelper _dbHelper = DbHelper.instance;
    _email = await _dbHelper.getUserEmail(username);
    notifyListeners();
  }

  void reset() {
    _username = '';
    _email = '';
    notifyListeners();
  }
  
}
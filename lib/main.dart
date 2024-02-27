import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/database_helper.dart';
import 'package:sportmate_flutter_application/database_ui_test.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelperUser.initDatabase();
  await DatabaseHelperAvailability.initDatabase();
  await DatabaseHelperMatches.initDatabase();
  runApp(SportMate());
}

class SportMate extends StatelessWidget {
  const SportMate({Key? key}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DatabaseUI(),
    );
  }
}
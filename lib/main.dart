import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/databaseHelper.dart';
import 'package:sportmate_flutter_application/databaseUI.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper.initDatabase();
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
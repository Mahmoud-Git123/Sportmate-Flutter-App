import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/database_helper.dart';
import 'package:sportsmate_flutter/database_ui_test.dart';
import 'package:sportsmate_flutter/pages/index.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SportMate());

  //Line from the DatabaseREADME step 1
  await DatabaseManager.initializeDatabase();
  

  //Line from the DatabaseREADME step 2
  //await DatabaseManager.openExistingDatabase();

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

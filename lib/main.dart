import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/database_helper.dart';
import 'package:sportsmate_flutter/database_ui_test.dart';
import 'package:sportsmate_flutter/pages/index.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SportMate());

  //Line from the DatabaseREADME step 1
  //await DatabaseManager.initializeDatabase();
  

  await DatabaseManager.databaseCreate();


  //Line from the DatabaseREADME step 2
  //await DatabaseManager.openExistingDatabase();

}

class SportMate extends StatelessWidget {
  const SportMate({Key? key}) : super(key: key);
  
  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportsMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DatabaseUI(),
    );
  }
}

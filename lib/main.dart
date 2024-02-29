<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/database_helper.dart';
import 'package:sportmate_flutter_application/database_ui_test.dart';
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
=======
import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportsMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Navigation(),
    );
  }
}
>>>>>>> origin/main

import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SportMate());

  //Line from the DatabaseREADME step 1
  // await DatabaseManager.initializeDatabase();

  //Line from the DatabaseREADME step 2
  //await DatabaseManager.openExistingDatabase();
}

class SportMate extends StatelessWidget {
  const SportMate({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SportsMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/DbTest.dart';
import 'package:sportsmate_flutter/pages/index.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(SportMate());
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
      home: const LoginPage(),
    );
  }
}

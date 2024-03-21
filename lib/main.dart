import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sportsmate_flutter/pages/login/loginpage.dart';
import 'userName.dart'; // Import the UsernameProvider class

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider(
      create: (context) => UsernameProvider(),
      child: const SportMate(),
    ),
  );
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

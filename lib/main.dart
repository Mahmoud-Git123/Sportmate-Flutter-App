import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/nav_bar.dart';
import 'pages/loginpage.dart';
import 'pages/test_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: navBar(),
      routes: {
        '/home': (context) =>  HomePage(),

      }
    );
  }
}
import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/schedule/schedule.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 230, 245, 253),
          foregroundColor: Color.fromARGB(255, 234, 234, 234),
          titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Color.fromARGB(255, 2, 38, 63),
            fontSize: 20,
          ),
        ),
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontFamily: 'Poppins',
          ),
          bodyText2: TextStyle(
            fontFamily: 'Poppins',
          ),
          button: TextStyle(
            fontFamily: 'Poppins',
          ),
          subtitle1: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: SchedulePage(),
    );
  }
}

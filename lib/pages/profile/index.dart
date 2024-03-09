import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/pages/profile/my_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

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
          titleLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Poppins',
          ),
          labelLarge: TextStyle(
            fontFamily: 'Poppins',
          ),
          titleMedium: TextStyle(
            fontFamily: 'Poppins',
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

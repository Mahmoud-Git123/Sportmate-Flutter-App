import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/databaseHelper.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseUI extends StatefulWidget {
  const DatabaseUI({Key? key}) : super(key: key);

  @override
  State<DatabaseUI> createState() => _DatabaseUIState();
}

class _DatabaseUIState extends State<DatabaseUI> {
  final user = const User(
    id: 1,
    firstname: 'Bob',
    lastname: 'Smith',
    dob: '01/01/2000',
    email: 'rhyswoods03@gmail.com',
    password: 'password',
    phone: '1234567890',
  );

  void printUserList() async {
  List<User> userList = await DatabaseHelper.getUsers();

  for (User user in userList) {
    print('User ID: ${user.id}');
    print('First Name: ${user.firstname}');
    print('Last Name: ${user.lastname}');
    print('Date of Birth: ${user.dob}');
    print('Email: ${user.email}');
    print('Password: ${user.password}');
    print('Phone: ${user.phone}');
    print('---'); // Separator for better readability
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SportMate'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Call a method from the database helper
                DatabaseHelper.insertUser(user);
              },
              child: Text('Insert Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call another method from the database helper
                printUserList();
              },
              child: Text('Query Data'),
            ),
            // Other UI elements
          ],
        ),
      ),
    );
  }
}

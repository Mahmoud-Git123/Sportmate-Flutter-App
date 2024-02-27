import 'package:flutter/material.dart';
import 'package:sportmate_flutter_application/database_helper.dart';

class DatabaseUI extends StatefulWidget {
  const DatabaseUI({Key? key}) : super(key: key);

  @override
  State<DatabaseUI> createState() => _DatabaseUIState();
}

class _DatabaseUIState extends State<DatabaseUI> {
  // ignore: prefer_const_constructors
  final user = User(
    id: 1,
    firstname: 'Bob',
    lastname: 'Smith',
    dob: '01/01/2000',
    email: 'rhyswoods03@gmail.com',
    password: 'password',
    phone: '1234567890',
    elo: '1000',
  );

  void printUserList() async {
  List<User> userList = await DatabaseHelperUser.getUsers();

  for (User user in userList) {
    print('User ID: ${user.id}');
    print('First Name: ${user.firstname}');
    print('Last Name: ${user.lastname}');
    print('Date of Birth: ${user.dob}');
    print('Email: ${user.email}');
    print('Password: ${user.password}');
    print('Phone: ${user.phone}');
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
                DatabaseHelperUser.insertUser(user);
              },
              child: const Text('Insert Data'),
            ),
            ElevatedButton(
              onPressed: () {
                // Call another method from the database helper
                printUserList();
              },
              child: const Text('Query Data'),
            ),
            // Other UI elements
          ],
        ),
      ),
    );
  }
}

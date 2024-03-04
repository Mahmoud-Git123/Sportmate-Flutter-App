import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/database_helper.dart';

class DatabaseUI extends StatefulWidget {
  const DatabaseUI({super.key});

  @override
  State<DatabaseUI> createState() => _DatabaseUIState();
}

class _DatabaseUIState extends State<DatabaseUI> {
  // ignore: prefer_const_constructors
  final user = User(
    id: 1,
    firstname: 'Emily',
    lastname: 'Jones',
    dob: '12/04/2002',
    email: 'emily@gmail.com',
    password: 'oaishd',
    phone: '45928237758',
    elo: '200',
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
    print('Elo: ${user.elo}');
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
            ElevatedButton(
              onPressed: () async {
                // Call another method from the database helper
                User? test = await DatabaseHelperUser.getUserByEmail("emily@gmail.com");
                print('User ID: ${test!.id}');
                print('First Name: ${test.firstname}');
              },
              child: const Text('Find user with specific email'),
            ),
          ]
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sportsmate_flutter/DbHelper.dart';

class DbTest extends StatelessWidget {
  const DbTest({Key? key}) : super(key: key);


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
                onPressed: () async{
                  // Call a method from the database helper

                  DbHelper dbHelper = DbHelper.instance;
                  Map<String, Object> testUser = {
                    'firstname': 'Emily',
                    'lastname': 'Jones',
                    'dob': '12/04/2002',
                    'email': 'emily@gmail.com',
                    'password': 'oaishd',
                    'phone': '45928237758',
                    'elo': 200,
                  };

                await dbHelper.insertUser(testUser);
                },
                child: const Text('Insert test data'),
              ), // test insert 

              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  List<Map<String, dynamic>> userRows = await dbHelper.userGetAllRows();
                  print(userRows);
                },
                child: const Text('Get all rows'),
              ), // get rows
              ElevatedButton(
                onPressed: () async {
                },
                child: const Text('Find user with specific email'),
              ), // query
            ]
          ),
        ),
      );
    }


}
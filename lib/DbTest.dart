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
                    'userName': 'Emily',
                    'email': 'emily@gmail.com',
                    'password': 'oaishd',
                    'elo': 100,
                  };
                  Map<String, Object> testUser2 = {
                    'userName': 'John',
                    'email': 'john@gmail.com',
                    'password': 'oaishd',
                    'elo': 100,
                  };

                await dbHelper.insertToTable('user', testUser);
                await dbHelper.insertToTable('user', testUser2);
                },
                child: const Text('Insert test data'),
              ), // test insert 

              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  List<Map<String, dynamic>> userRows = await dbHelper.getAllRows('user');
                  print(userRows);
                },
                child: const Text('Get all rows'),
              ), // get rows
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  Map<String, Object> testAvailability = {
                    'userName': 'Emily',
                    'dateTime': '2025-01-01 12:00:00:00',
                    'sport': 'Tennis',
                  };
                  Map<String, Object> testAvailability2 = {
                    'userName': 'John',
                    'dateTime': '2025-01-01 12:00:00:00',
                    'sport': 'Tennis',
                  };
                  await dbHelper.insertToTable('availability', testAvailability);
                  await dbHelper.insertToTable('availability', testAvailability2);
                },
                child: const Text('Availibility test'), 
              ), // query
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  List<Map<String, dynamic>> availabilityRows = await dbHelper.getAllRows('availability');
                  print(availabilityRows);
                },
                child: const Text('Get all availibility rows'),
              ), // get rows
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  Map<String, Object> testMatch = {
                    'sport': 'Tennis',
                    'dateTime': '2024/04/12 12:00:00',
                    'location': 'London',
                    'homeName': 'Emily',
                    'awayName': 'John',
                    'homeElo': 200,
                    'homePredictedResult': 0.5,
                    'awayElo': 200,
                    'awayPredictedResult': 0.5,
                    'gameResult': 'draw',
                  };

                  await dbHelper.insertToTable('match', testMatch);
                },
                child: const Text('Match test'), 
              ), // query
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  List<Map<String, dynamic>> matchRows = await dbHelper.getAllRows('match');
                  print(matchRows);
                },
                child: const Text('Get all match rows'),
              ), // get rows
              ElevatedButton(
                onPressed: () async {
                  DbHelper dbHelper = DbHelper.instance;
                  await dbHelper.deleteDatabase();
                },
                child: const Text('Delete database'),
              ), // delete database
            ]
          ),
        ),
      );
    }


}
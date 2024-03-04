import 'dart:async';
import 'dart:ffi';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Database? _sportmatedb;

class DatabaseManager {

  static Future<void> databaseCreate() async {
    final _sportmatedb = openDatabase(join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) async {
        // Create the necessary tables
        await DatabaseHelperUser.createUserTable();
        await DatabaseHelperAvailability.createAvailabilityTable();
        await DatabaseHelperMatches.createMatchesTable();
      },
      version: 1, // Increment this number when you need to upgrade the database schema
    );
  }

   static Future<void> initializeDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Open the database
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) async {
        // Create the necessary tables
        await DatabaseHelperUser.createUserTable();
        await DatabaseHelperAvailability.createAvailabilityTable();
        await DatabaseHelperMatches.createMatchesTable();
      },
      version: 1, // Increment this number when you need to upgrade the database schema
    );
  }

  // Open the database
  static Future<void> openExistingDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
    );
  }

  // Close the database
  static Future<void> closeDatabase() async {
    await _sportmatedb!.close();
  }

  // Old code to drop table if exists
  //
  // static Future <void> executeSQLCommands() async {
  //   final db = await _sportmatedb!;
  //   await db.execute(
  //     // SQL statement to create user table
  //     'DROP TABLE IF EXISTS users',
  //   );
  // }

  // Old code to print database info
  //   static Future<void> printDatabaseInfo() async {
  //   // Open the database
  //   Database database = await openDatabase(
  //     join(await getDatabasesPath(), 'sportmate_database.db'),
  //   );

  //   // Query the database
  //   List<Map<String, dynamic>> rows = await database.rawQuery('SELECT * FROM users');

  //   // Log the results
  //   for (Map<String, dynamic> row in rows) {
  //     print(row);
  //   }

  //   // Close the database
  //   await database.close();
  // }
}

class DatabaseHelperUser {

  // Create the user table
  static Future<void> createUserTable() async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await _sportmatedb!;
    await db.execute(
      // SQL statement to create user table
      'CREATE TABLE users(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT, email TEXT, password TEXT, phone TEXT, elo TEXT)',
    );
  }

  // User table CRUD operations

  // Insert a user into the database
  static Future<int> insertUser(User user) async {
    WidgetsFlutterBinding.ensureInitialized();
    final db = await _sportmatedb!;
     final Map<String, Object?> userMap = user.toMapUsers();
    userMap.remove('id');
    return await db.insert(
    'users',
    userMap,
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Query a list of users from the database
  static Future<List<User>> getUsers() async {
    final db = await _sportmatedb!;
    final List<Map<String, Object?>> userMaps = await db.query('users');

    return userMaps.map((userMap) {
      return User(
        id: userMap['id'] as int,
        firstname: userMap['firstname'] as String,
        lastname: userMap['lastname'] as String,
        dob: userMap['dob'] as String,
        email: userMap['email'] as String,
        password: userMap['password'] as String,
        phone: userMap['phone'] as String,
        elo: userMap['elo'] as String,
      );
    }).toList();
  }

  // Update a user in the database
  static Future<void> updateUser(User user) async {
    final db = await _sportmatedb!;
    await db.update(
      'users',
      user.toMapUsers(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  // Delete a user from the database
  static Future<void> deleteUser(int id) async {
    final db = await _sportmatedb!;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }


  // Custom SQL query to DB user table example
  
  static Future <User?> getUserByEmail(String email) async {
    final db = await _sportmatedb!;
    final List<Map<String, Object?>> userMaps = await db.query('users', where: 'email = ?', whereArgs: [email]);

    if (userMaps.isNotEmpty) {
      return User(
        id: userMaps[0]['id'] as int,
        firstname: userMaps[0]['firstname'] as String,
        lastname: userMaps[0]['lastname'] as String,
        dob: userMaps[0]['dob'] as String,
        email: userMaps[0]['email'] as String,
        password: userMaps[0]['password'] as String,
        phone: userMaps[0]['phone'] as String,
        elo: userMaps[0]['elo'] as String,
      );
    } else {
      return null;
    }
  }

}

class DatabaseHelperAvailability {

  // Create the availability table
  static Future<void> createAvailabilityTable() async {
    final db = await _sportmatedb!;
    await db.execute(
      // SQL statement to create availability table
      'CREATE TABLE availability(id INTEGER PRIMARY KEY, date TEXT, time TEXT, sport TEXT)',
    );
  }

  // Availability table CRUD operations

  // Insert availability into the database
  static Future<int> insertAvailability(Availability availability) async {
    final db = await _sportmatedb!;
    Map<String, Object?> availabilityMap = availability.toMapAvailability();
    availabilityMap.remove('id');
    return await db.insert(
      'availability',
      availabilityMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Query a list of availability from the database
  static Future<List<Availability>> getAvailability() async {
    final db = await _sportmatedb!;
    final List<Map<String, Object?>> availabilityMaps =
        await db.query('availability');

    return availabilityMaps.map((availabilityMap) {
      return Availability(
        id: availabilityMap['id'] as int,
        date: availabilityMap['date'] as String,
        time: availabilityMap['time'] as String,
        sport: availabilityMap['sport'] as String,
      );
    }).toList();
  }

  // Update availability in the database
  static Future<void> updateAvailability(Availability availability) async {
    final db = await _sportmatedb!;
    await db.update(
      'availability',
      availability.toMapAvailability(),
      where: 'id = ?',
      whereArgs: [availability.id],
    );
  }

  // Delete availability from the database
  static Future<void> deleteAvailability(int id) async {
    final db = await _sportmatedb!;
    await db.delete(
      'availability',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class DatabaseHelperMatches {

  // Create the matches table
  static Future<void> createMatchesTable() async {
    final db = await _sportmatedb!;
    await db.execute(
      // SQL statement to create matches table
      'CREATE TABLE matches(id INTEGER PRIMARY KEY, sport TEXT, home TEXT, away TEXT, homeElo FLOAT, awayElo FLOAT, date TEXT, time TEXT, location TEXT, homeResult INTEGER, awayResult INTEGER, finalResult INTEGER)',
    );
  }

  // Matches table CRUD operations

  // Insert matches into the database
  static Future<int> insertMatches(Matches matches) async {
    final db = await _sportmatedb!;
    Map<String, Object?> matchesMap = matches.toMapMatches();
    matchesMap.remove('id');
    return await db.insert(
      'matches',
      matchesMap,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Query a list of matches from the database
  static Future<List<Matches>> getMatches() async {
    final db = await _sportmatedb!;
    final List<Map<String, Object?>> matchesMaps = await db.query('matches');

    return matchesMaps.map((matchesMap) {
      return Matches(
        id: matchesMap['id'] as int,
        sport: matchesMap['sport'] as String,
        home: matchesMap['home'] as String,
        away: matchesMap['away'] as String,
        homeElo: matchesMap['homeElo'] as Float,
        awayElo: matchesMap['awayElo'] as Float,
        date: matchesMap['date'] as String,
        time: matchesMap['time'] as String,
        location: matchesMap['location'] as String,
        homeResult: matchesMap['homeResult'] as int,
        awayResult: matchesMap['awayResult'] as int,
        finalResult: matchesMap['finalResult'] as int,
      );
    }).toList();
  }

  // Update matches in the database
  static Future<void> updateMatches(Matches matches) async {
    final db = await _sportmatedb!;
    await db.update(
      'matches',
      matches.toMapMatches(),
      where: 'id = ?',
      whereArgs: [matches.id],
    );
  }

  // Delete matches from the database
  static Future<void> deleteMatches(int id) async {
    final db = await _sportmatedb!;
    await db.delete(
      'matches',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

// Matches model
class Matches {
  final int id;
  final String sport;
  final String home;
  final String away;
  final Float homeElo;
  final Float awayElo;
  final String date;
  final String time;
  final String location;
  final int homeResult;
  final int awayResult;
  final int finalResult;

  const Matches({
    required this.id,
    required this.sport,
    required this.home,
    required this.away,
    required this.homeElo,
    required this.awayElo,
    required this.date,
    required this.time,
    required this.location,
    required this.homeResult,
    required this.awayResult,
    required this.finalResult,
  });

  Map<String, Object?> toMapMatches() {
    return {
      'id': id,
      'sport': sport,
      'home': home,
      'away': away,
      'homeElo': homeElo,
      'awayElo': awayElo,
      'date': date,
      'time': time,
      'location': location,
      'homeResult': homeResult,
      'awayResult': awayResult,
      'finalResult': finalResult,
    };
  }
}

//Availability model
class Availability {
  final int id;
  final String date;
  final String time;
  final String sport;

  const Availability({
    required this.id,
    required this.date,
    required this.time,
    required this.sport,
  });

  Map<String, Object?> toMapAvailability() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'sport': sport,
    };
  }
}

// User model
class User {
  final int id;
  final String firstname;
  final String lastname;
  final String dob;
  final String email;
  final String password;
  final String phone;
  final String elo;

  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.email,
    required this.password,
    required this.phone,
    required this.elo,
  });

  Map<String, Object?> toMapUsers() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'email': email,
      'password': password,
      'phone': phone,
      'elo': elo,
    };
  }
}

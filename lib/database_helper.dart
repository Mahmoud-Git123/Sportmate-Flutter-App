import 'dart:async';
import 'dart:ffi';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelperUser {
  static Database? _sportmatedb;

  // Open the database
  static Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // SQL statement to create user table
          'CREATE TABLE users(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT, email TEXT, password TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  // User table CRUD operations
  static Future<int> insertUser(User user) async {
    final db = await _sportmatedb!;
    return await db.insert(
      'users',
      user.toMapUsers(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

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

  static Future<void> updateUser(User user) async {
    final db = await _sportmatedb!;
    await db.update(
      'users',
      user.toMapUsers(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  static Future<void> deleteUser(int id) async {
    final db = await _sportmatedb!;
    await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class DatabaseHelperAvailability {
  static Database? _sportmatedb;

  // Open the database

  static Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // SQL statement to create availability table
          'CREATE TABLE availability(id INTEGER PRIMARY KEY, date TEXT, time TEXT, sport TEXT)',
        );
      },
      version: 1,
    );
  }

  // Availability table CRUD operations
  static Future<int> insertAvailability(Availability availability) async {
    final db = await _sportmatedb!;
    return await db.insert(
      'availability',
      availability.toMapAvailability(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  
  static Future<List<Availability>> getAvailability() async {
  final db = await _sportmatedb!;
  final List<Map<String, Object?>> availabilityMaps = await db.query('availability');

  return availabilityMaps.map((availabilityMap) {
    return Availability(
      id: availabilityMap['id'] as int,
      date: availabilityMap['date'] as String,
      time: availabilityMap['time'] as String,
      sport: availabilityMap['sport'] as String,
    );
  }).toList();
}

  static Future<void> updateAvailability(Availability availability) async {
    final db = await _sportmatedb!;
    await db.update(
      'availability',
      availability.toMapAvailability(),
      where: 'id = ?',
      whereArgs: [availability.id],
    );
  }

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
  static Database? _sportmatedb;

  // Open the database

  static Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) {
        return db.execute(
          // SQL statement to create matches table
          'CREATE TABLE matches(id INTEGER PRIMARY KEY, sport TEXT, home TEXT, away TEXT, homeElo REAL, awayElo REAL, date TEXT, time TEXT, location TEXT, homeResult INTEGER, awayResult INTEGER, finalResult INTEGER)',
        );
      },
      version: 1,
    );
  }

  // Matches table CRUD operations
  static Future<int> insertMatches(Matches matches) async {
    final db = await _sportmatedb!;
    return await db.insert(
      'matches',
      matches.toMapMatches(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

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

  static Future<void> updateMatches(Matches matches) async {
    final db = await _sportmatedb!;
    await db.update(
      'matches',
      matches.toMapMatches(),
      where: 'id = ?',
      whereArgs: [matches.id],
    );
  }

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
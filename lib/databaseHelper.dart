import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static Database? _sportmatedb;

  static Future<void> initDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    _sportmatedb = await openDatabase(
      join(await getDatabasesPath(), 'sportmate_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE users(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT, email TEXT, password TEXT, phone TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<int> insertUser(User user) async {
    final db = await _sportmatedb!;
    return await db.insert(
      'users',
      user.toMap(),
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
    );
  }).toList();
}

  static Future<void> updateUser(User user) async {
    final db = await _sportmatedb!;
    await db.update(
      'users',
      user.toMap(),
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

class User {
  final int id;
  final String firstname;
  final String lastname;
  final String dob;
  final String email;
  final String password;
  final String phone;

  const User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.dob,
    required this.email,
    required this.password,
    required this.phone,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'firstname': firstname,
      'lastname': lastname,
      'dob': dob,
      'email': email,
      'password': password,
      'phone': phone,
    };
  }
}

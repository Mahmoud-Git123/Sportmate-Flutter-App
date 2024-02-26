import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


void initialiseDatabase() async{


      WidgetsFlutterBinding.ensureInitialized();

      final sportmatedb = openDatabase(
        join(await getDatabasesPath(), 'sportmate_database.db'),
        onCreate: (db, version) {
          return db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, dob TEXT, email TEXT, password TEXT, phone TEXT)',
          );
        },
        version: 1,
      );

      Future<void> insertUser(User user) async {
        final db = await sportmatedb;
        await db.insert(
          'users',
          user.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace,
        );
      }

      Future<List<User>> users() async {
      
        final db = await sportmatedb;

        final List<Map<String, Object?>> userMaps = await db.query('users');

        
        return List.generate(userMaps.length, (i) {
          return User(
            id: userMaps[i]['id'] as int,
            firstname: userMaps[i]['firstname'] as String,
            lastname: userMaps[i]['lastname'] as String,
            dob: userMaps[i]['dob'] as String,
            email: userMaps[i]['email'] as String,
            password: userMaps[i]['password'] as String,
            phone: userMaps[i]['phone'] as String,
          );
        });
      }

      Future<void> updateUser(User user) async {
        final db = await sportmatedb;

        await db.update(
          'users',
          user.toMap(),
          where: 'id = ?',
          whereArgs: [user.id],
        );
      }

      Future<void> deleteUser(int id) async {
        final db = await sportmatedb;

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

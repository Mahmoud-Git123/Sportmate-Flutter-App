import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  static final _dbName = "sportMateDb";
  static final _dbVersion = 2;

  // singleton class, one database across the app
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  // if database doesnt exist, then is created in the app's documents directory (_init and _onCreate methods are called)
  static Database? _sportMateDb;
  Future<Database> get database async {
    if (_sportMateDb != null) return _sportMateDb!;
    _sportMateDb = await _init();
    return _sportMateDb!;
  }

  // initalises the database
  _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, _dbName);
    return await openDatabase(dbPath, version: _dbVersion, onCreate: _onCreate);
  }

  // creates each table
  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userName TEXT,
        email TEXT,
        password TEXT,
        elo FLOAT
      )
    ''');

    await db.execute('''
      CREATE TABLE availability(
        id INTEGER PRIMARY KEY,
        email TEXT,
        dateTime DATETIME,
        sport TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE match(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sport TEXT,
        dateTime DATETIME,
        location TEXT,
        homeName TEXT,
        awayName TEXT,
        homeElo FLOAT,
        homePredictedResult FLOAT,
        awayElo FLOAT,
        awayPredictedResult FLOAT,
        gameResult TEXT
      )
    ''');

  }

  // deletes the database (ONLY TO BE USED WHEN ADDING NEW TABLES OR CHANGING THE DATABASE STRUCTURE)
  Future<void> deleteDatabase() async {
    //gets path of database
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, _dbName);
    bool exists = await File(dbPath).exists();
    if (exists) {
      // if the database file exists, delete it
      await File(dbPath).delete();
      print('Database deleted');
    } else {
      print('Database doesnt exist');
    }
}

  
  // inserts into a table spceified by the params (name of table in '' and data in a map)
  Future<int> insertToTable(String tableName, Map<String, Object> data) async {
    Database db = await instance.database;
    return await db.insert(tableName, data);
  }
  
  // returns all rows from a table specified by the param (name of table in '')
  Future<List<Map<String, dynamic>>> getAllRows(String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }


  // Method to get a row from the table based on the username
  Future<Map<String, dynamic>?> getRowByUsername(String tableName, String username) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> rows = await db.query(
      tableName,
      where: 'username = ?',
      whereArgs: [username],
    );
    // If rows are returned, return the first row, otherwise return null
    return rows.isNotEmpty ? rows.first : null;
  }

  // Method to access the password field of the row returned by getRowByUsername
  Future<String?> getPasswordByUsername(String tableName, String username) async {
    // Get the row based on the username
    Map<String, dynamic>? row = await getRowByUsername(tableName, username); 
    // If the row is not null and contains a 'password' field, return the password
    if (row != null && row.containsKey('password')) {
      return row['password'] as String?;
    } else {
      return null;
    }
  }

  // Method to check if a username exists in the database
  Future<bool> doesUsernameExist(String tableName, String username) async {
    // Get the row based on the username
    Map<String, dynamic>? row = await getRowByUsername(tableName, username);
    // If the row is not null, return true indicating that the username exists
    return row != null;
  }

  Future<Map<String, dynamic>?> getRowByEmail(String tableName, String email) async {
    Database db = await instance.database;
    // Perform a database query to fetch the row based on the email
    List<Map<String, dynamic>> rows = await db.query(
      tableName, // Assuming 'users' is the table name
      where: 'email = ?',
      whereArgs: [email],
    );
    // Return the first row if found, otherwise return null
    return rows.isNotEmpty ? rows.first : null;
  }

  // Method to check if an email is already in use
  Future<bool> isEmailInUse(String tableName, String email) async {
    // Get the row based on the email
    Map<String, dynamic>? row = await getRowByEmail(tableName, email);
    // If the row is not null, return true indicating that the email is already in use
    return row != null;
  }


}

  // returns all rows from a specific table where a column has a specific value
  Future <List<Map<String, dynamic>>> getRowsWhere(String tableName, String column, String value) async {
    Database db = await instance.database;
    return await db.query(tableName, where: '$column = ?', whereArgs: [value]);
  }

  // returns all rows from a specific table where a column has a value between two values
  Future<List<Map<String, dynamic>>> getRowsWhereBetween(String tableName, String column, double lower, double upper) async {
    Database db = await instance.database;
    return await db.query(tableName, where: '$column BETWEEN ? AND ?', whereArgs: [lower, upper]);
  }

  Future<List<Map<String, dynamic>>> joinUserAndAvailability(double lowerElo, double upperElo, String dateTime) async {
    Database db = await instance.database;
    return await db.rawQuery('''
    SELECT user.userName, user.elo, availability.dateTime, availability.sport FROM user
    INNER JOIN availability ON user.email = availability.email
    WHERE user.elo BETWEEN $lowerElo AND $upperElo
    AND availability.dateTime = '$dateTime'
    ''');
  }
}

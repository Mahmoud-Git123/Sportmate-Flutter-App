import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{

  static final _dbName = "sportMateDb";
  static final _dbVersion = 1;
  static final userTable = 'user';
  
  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database? _sportMateDb;
  Future<Database> get database async {
    if (_sportMateDb != null) return _sportMateDb!;
    _sportMateDb = await _init();
    return _sportMateDb!;
  }

  _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Directory docDir = await getApplicationDocumentsDirectory();
    String dbPath = join(docDir.path, _dbName);
    return await openDatabase(dbPath, version: _dbVersion, onCreate: _onCreate);
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE user(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstname TEXT,
        lastname TEXT,
        dob TEXT,
        email TEXT,
        password TEXT,
        phone TEXT,
        elo FLOAT
      )
    ''');
  }

  Future<int> insertUser(Map<String, Object> user) async {
    Database db = await instance.database;
    return await db.insert(userTable, user);
  }

    Future<List<Map<String, dynamic>>> userGetAllRows() async {
    Database db = await instance.database;
    return await db.query(userTable);
  }

}
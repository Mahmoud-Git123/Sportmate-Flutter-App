import 'package:path/path.dart';
import 'package:sportsmate_flutter/JSON%20models/user_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final userDatabase = 'users.db';
  String userTable = 
    "CREATE TABLE users (userID INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT NOT NULL, userEmail TEXT NOT NULL, userPassword TEXT NOT NULL, userNumber INT NOT NULL)";
  
  //creating the table 
  Future<Database> initDB() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, userDatabase);

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute(userTable);  
    });
  }

  
//sign up method 
  Future<int> signup(UserModel user) async {
    final Database db = await initDB();
    return db.insert('users', user.toMap());
  }


  //login method 
  Future<bool> login(UserModel user) async {
    final Database db = await initDB();
    db.insert('users', user.toMap());

    var result = await db.rawQuery(
      "SELECT * FROM users WHERE userName = '${user.userName}' AND userPassword = '${user.userPassword}'");

    if(result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}


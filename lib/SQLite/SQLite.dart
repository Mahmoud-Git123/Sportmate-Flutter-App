import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  final userDatabase = 'users.db';
  String userTable = 
    "CREATE TABLE users (userID INTEGER PRIMARY KEY AUTOINCREMENT, userName TEXT NOT NULL, userEmail TEXT NOT NULL, userPassword TEXT NOT NULL, )";
  
  Future<DatabaseHelper> initDB() async {
    final dataBasePath = await getDatabasesPath();
    final path = join(dataBasePath, userDatabase);

  //   return openDatabase(path, version: 1, onCreate: (db, version) async {
  //     await db.execute(users);
  //     await db.execute(userTable);  
  //   });

  }

}

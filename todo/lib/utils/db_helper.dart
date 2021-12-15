import 'package:flutterspeechrecognizerifly_example/model/task.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutterspeechrecognizerifly_example/model/user.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database _database;
  final String tableName = 'tableUser';
  final String columnId = 'id';
  final String columnUsername = 'username';
  final String columnNickname = 'nickname';
  final String columnPassword = 'password';
  final String columnEmail = 'email';
  final String columnPhone='phone';
  //
  // final String table2Name = 'tableTask';
  // final String column2Id = 'id';
  // final String column2Username = 'username';
  // final String column2Context = 'context';
  // final String column2Endtime = 'endtime';
  // final String column2IsFinish = 'isfinish';


  DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  Future<Database> get _db async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDb();
    return _database;
  }

  Future<Database> _initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, 'flutter_sqlite.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    var sql = "CREATE TABLE $tableName($columnId INTEGER AUTO_INCREMENT, "
        "$columnUsername TEXT PRIMARY KEY, "
        "$columnNickname TEXT , "
        "$columnPassword TEXT , "
        "$columnEmail TEXT,"
        "$columnPhone TEXT)";

    // var sql2 ="CREATE TABLE $tableName($column2Id INTEGER PRIMARY KEY AUTOINCREMENT, "
    //     "$column2Username TEXT,"
    //     "$column2Context TEXT,"
    //     "$column2Endtime TEXT,"
    //     "$column2IsFinish INT2)";

    await db.execute(sql);
    // await db.execute(sql2);

  }

  /*以下为user数据库部分*/
  Future<int> saveUser(user user) async {
    var dbClient = await _db;
    int result = await dbClient.insert(tableName, user.toMap());
    return result;
  }

  Future<user> checkLogin(String username, String password) async {
    var dbClient = await _db;
    var result = await dbClient.rawQuery(
        "SELECT * FROM $tableName WHERE username = '$username' AND password = '$password'");
    if (result.length > 0) {
      return user.fromMap(result.first);
    }
    return null;
  }
  Future<user> userinfo(String username) async {
    var dbClient = await _db;
    var result = await dbClient.rawQuery(
        'SELECT * FROM $tableName WHERE username = "$username" ');
    return user.fromMap(result.first);
  }

  Future<int> upnickname(String nickname,String username) async {
    var dbClient = await _db;
    int result = await dbClient.rawUpdate(
      'UPDATE $tableName SET nickname = "$nickname" WHERE username = "$username"');
    return result;
  }

  Future<int> upemail(String email,String username) async {
    var dbClient = await _db;
    int result = await dbClient.rawUpdate(
        'UPDATE $tableName SET email = "$email" WHERE username = "$username"');
    return result;
  }


  Future<int> upphone(String phone,String username) async {
    var dbClient = await _db;
    int result = await dbClient.rawUpdate(
        'UPDATE $tableName SET phone = "$phone" WHERE username = "$username"');
    return result;
  }

  Future<int> uppwd(String pwd,String username) async {
    var dbClient = await _db;
    int result = await dbClient.rawUpdate(
        'UPDATE $tableName SET password = "$pwd" WHERE username = "$username"');
    return result;
  }
}
import 'dart:io';
import 'package:learn_first/model/ToDo_Item.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();

  DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  final String tableName = 'todoTbl';
  final String colId = 'id';
  final String colItemName = 'itemName';
  final String colDateCreated = 'dateCreated';
  final String colDeadline = 'deadline';

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'ToDo_Db.db');
    var ourDb = openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $tableName($colId INTEGER PRIMARY KEY AUTOINCREMENT,$colItemName TEXT,$colDateCreated TEXT,$colDeadline TEXT)');
  }

  Future<int> saveNoDoItem(ToDoItem item) async {
    var dbClient = await db;
    int res = await dbClient!.insert('$tableName', item.toMap());
    return res;
  }

  Future<List> getAllNoDoItems() async {
    var dbClient = await db;
    var result =
    dbClient!.rawQuery('SELECT * FROM $tableName ORDER BY $colItemName ASC');
    return result;
  }

  Future<int?> getCount() async {
    var dbClient = await db;
    return Sqflite.firstIntValue(
        await dbClient!.rawQuery('SELECT COUNT FROM $tableName'));
  }

  Future<ToDoItem?> getNoDoItem(int id) async {
    var dbClient = await db;
    var result =
    await dbClient!.rawQuery('SELECT * FROM $tableName WHERE $colId = $id');
    if (result.length == 0) return null;
    return ToDoItem.fromMap(result.first);
  }

  //delete an item
  Future<int> deleteToDoItem(int id) async {
    var dbClient = await db;
    return await dbClient!.delete(tableName, where: '$colId=?', whereArgs: [id]);
  }

  //update an item
  Future<int> updateNoDoItem(ToDoItem user) async {
    var dbClient = await db;
    return await dbClient!.update(tableName, user.toMap(),
        where: '$colId=?', whereArgs: [user.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient!.close();
  }
}
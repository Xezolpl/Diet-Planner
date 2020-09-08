import 'package:sqflite/sqflite.dart';

abstract class DatabaseSingleton {
  static final Future<Database> _database = openDatabase('path');

  static get database async {
    return await _database;
  }
}

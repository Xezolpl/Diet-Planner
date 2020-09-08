import 'package:sqflite/sqflite.dart';
export 'package:sqflite/sqflite.dart';
import 'dart:async';

abstract class DatabaseSingleton {
  static final Future<Database> _database = openDatabase('local_database.db');

  static Future<Database> get database => _database;
}

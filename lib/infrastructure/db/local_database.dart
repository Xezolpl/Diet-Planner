import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';
export 'package:sqflite/sqflite.dart';
import 'dart:async';

@module
abstract class DatabaseSingleton {
  final Future<Database> _database = openDatabase('local.db',
      version: 1, onCreate: (db, version) async => _createTables(db));

  @preResolve
  Future<Database> get database => _database;

  static _createTables(Database db) async {
    log('Creating sqlite tables');
    await db.execute(CREATE_PRODUCTS_TABLE_SQL);
  }
}

const CREATE_PRODUCTS_TABLE_SQL = '''
      CREATE TABLE "products" (
        "id"	TEXT NOT NULL UNIQUE,
        "name"	TEXT NOT NULL,
        "category"	TEXT,
        "weight"	NUMERIC,
        "kcal"	INTEGER NOT NULL,
        "carbohydrates"	NUMERIC NOT NULL,
        "proteins"	NUMERIC NOT NULL,
        "fats"	NUMERIC NOT NULL,
        "sugars"	NUMERIC,
        "salt"	NUMERIC,
        "saturated"	NUMERIC,
        "monounsaturated"	NUMERIC,
        "poliunsaturated"	NUMERIC,
        "omega3"	NUMERIC,
        "omega6"	NUMERIC,
        "ala"	NUMERIC,
        "epa"	NUMERIC,
        "dha"	INTEGER,
        "fibre"	NUMERIC,
        "cholesterol"	NUMERIC,
        "caffeine"	NUMERIC,
        "vitaminA"	NUMERIC,
        "vitaminB1"	NUMERIC,
        "vitaminB2"	NUMERIC,
        "vitaminB3"	NUMERIC,
        "vitaminB4"	NUMERIC,
        "vitaminB5"	NUMERIC,
        "vitaminB6"	NUMERIC,
        "vitaminB7"	NUMERIC,
        "vitaminB9"	NUMERIC,
        "vitaminB12"	NUMERIC,
        "vitaminC"	NUMERIC,
        "vitaminD"	NUMERIC,
        "vitaminE"	NUMERIC,
        "vitaminK"	NUMERIC,
        "sodium"	NUMERIC,
        "potassium"	NUMERIC,
        "calcium"	NUMERIC,
        "magnesium"	NUMERIC,
        "phosphorous"	NUMERIC,
        "iron"	NUMERIC,
        "copper"	NUMERIC,
        "zinc"	NUMERIC,
        "fluorine"	NUMERIC,
        "selenium"	NUMERIC,
        "iodine"	NUMERIC,
        PRIMARY KEY("id")
      );
    ''';

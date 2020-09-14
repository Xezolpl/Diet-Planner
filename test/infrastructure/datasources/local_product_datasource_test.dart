import 'dart:convert';

import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/infrastructure/datasources/local_product_datasource.dart';
import 'package:diet_planner/infrastructure/db/local_database.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

///EVERYTHING IS WRONG AND IT CANNOT WORK
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  sqfliteFfiInit();
  group('getProduct', () {
    Product tProduct =
        Product.fromJson(json.decode(fixture('test_product.json')));
    Database database;

    setUp(() async {
      database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
      await database.execute(CREATE_PRODUCTS_TABLE_SQL);
      await database.insert(PRODUCTS_TABLE, tProduct.toJson());
    });

    test(
      'should return same product from SQLite Database as from json decoding',
      () async {
        //assert product directly from json to product from the database
        await database.query(PRODUCTS_TABLE, where: 'id = ?', whereArgs: [
          tProduct.id
        ]).then((value) => expect(tProduct, Product.fromJson(value.first)));
        //close
        database.close();
      },
    );
  });
}

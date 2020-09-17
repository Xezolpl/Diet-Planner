import 'dart:convert';

import 'package:diet_planner/core/error/exceptions.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/infrastructure/datasources/local_product_datasource.dart';
import 'package:diet_planner/infrastructure/db/local_database.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  sqfliteFfiInit();

  LocalProductDataSourceImpl localDataSource;
  Database testDatabase;
  Product tProduct =
      Product.fromJson(json.decode(fixture('test_product.json')));

  setUp(() async {
    testDatabase = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    localDataSource = LocalProductDataSourceImpl(testDatabase);
    await testDatabase.execute(CREATE_PRODUCTS_TABLE_SQL);
  });
  group('getProduct', () {
    setUp(() async {
      await testDatabase.insert(PRODUCTS_TABLE, tProduct.toJson());
    });

    test(
      'should return product from SQLite Database',
      () async {
        //act
        final result = await localDataSource
            .getProduct(ProductDatabaseParams(id: tProduct.id));
        //assert
        expect(tProduct, result);
        //close
        testDatabase
          ..delete('products')
          ..close();
      },
    );

    test(
      '''should throw a DatabaseException when there is
         not a product with that concrete id''',
      () async {
        String dumpId = 'i do not exist';
        // act
        final call = localDataSource.getProduct;
        // assert
        try {
          expect(() => call(ProductDatabaseParams(id: dumpId)),
              throwsA(isA<CacheException>()));
        } on CacheException {}

        //close
        testDatabase
          ..delete('products')
          ..close();
      },
    );
  });
  group('checkOrCache product', () {
    test(
      'should insert product into the SQLite Database',
      () async {
        // act
        await localDataSource.checkOrCache(tProduct);
        // assert
        final result = await localDataSource
            .getProduct(ProductDatabaseParams(id: tProduct.id));
        expect(result, tProduct);
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );
  });

  group('insert product', () {
    test(
      'should insert the product to the database',
      () async {
        // arrange
        await localDataSource.insert(tProduct);

        // act
        final result = await localDataSource
            .getProduct(ProductDatabaseParams(id: tProduct.id));
        // assert
        expect(result, tProduct);
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );

    test(
      '''should throw SqfliteFfiException when trying to insert
      second product same id''',
      () async {
        // arrange
        await localDataSource.insert(tProduct);
        // act
        final call = localDataSource.insert;
        // assert
        expect(
            () => call(tProduct), throwsA(isInstanceOf<DatabaseException>()));
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );
  });

  group('update product', () {
    test(
      'should update the product in the database',
      () async {
        Product updatedProduct =
            tProduct.copyWith(name: 'Updated product name');
        // arrange
        await localDataSource.insert(tProduct);
        await localDataSource.update(updatedProduct);

        // act
        final result = await localDataSource
            .getProduct(ProductDatabaseParams(id: tProduct.id));
        // assert
        expect(result, updatedProduct);
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );

    test(
      '''updating nonexistent product -should return 0''',
      () async {
        //act
        final recordsUpdated = await localDataSource.update(tProduct);
        // assert
        expect(recordsUpdated, 0);
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );
  });
  group('delete product', () {
    test(
      'deleting nonexistent product - should return 0',
      () async {
        //act
        var recordsRemoved = await localDataSource.delete(tProduct);
        // assert
        expect(recordsRemoved, 0);
        //clean up
        testDatabase
          ..delete('products')
          ..close();
      },
    );
  });
}

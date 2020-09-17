import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/exceptions.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/network_info.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/infrastructure/datasources/api_product_datasource.dart';
import 'package:diet_planner/infrastructure/datasources/database_product_datasource.dart';
import 'package:diet_planner/infrastructure/datasources/local_product_datasource.dart';
import 'package:diet_planner/infrastructure/db/local_database.dart';
import 'package:diet_planner/infrastructure/repositories/product_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:diet_planner/domain/entities/product.dart';

import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  sqfliteFfiInit();

  ProductRepositoryImpl repository;
  Product tProduct =
      Product.fromJson(json.decode(fixture('test_product.json')));
  Database database;

  setUp(() async {
    database = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    repository = ProductRepositoryImpl(
      ApiProductDataSourceImpl(),
      DatabaseProductDataSourceImpl(),
      LocalProductDataSourceImpl(database),
      NetworkInfoImpl(),
    );
    await database.execute(CREATE_PRODUCTS_TABLE_SQL);
  });

/* not implemented yet
  group('getProductFromApi', () {
    test('should get product from API data source', () async {
      //act
      //TODO: ADD BARCODE TO THE PRODUCT FACTORY
      final result = await repository.getProductFromApi(tProduct.barcode);
      //assert
      expect(tProduct, result);
    });

    test('should throw ApiException when product is not found in API',
        () async {
      int wrongBarcode = -123456;
      //act
      final call = repository.getProductFromApi;
      //assert
      expect(() => call(wrongBarcode), throwsA(isInstanceOf<ApiException>()));
    });
  });

  group('getProductRemote', () {
    test('should get product from remote server data source', () async {
      //act
      final result = await repository
          .getProductRemote(ProductDatabaseParams(id: tProduct.id));
      //assert
      expect(tProduct, result);
    });

    test(
        'should throw ServerException when product is not found in remote server',
        () async {
      String wrongId = 'i do not exist';
      //act
      final call = repository.getProductRemote;
      //assert
      expect(() => call(ProductDatabaseParams(id: wrongId)),
          throwsA(isInstanceOf<ServerException>()));
    });
  });
*/
  group('getProductLocal', () {
    test(
        'should return product from database, closed in Either<Failure,Product> clausule',
        () async {
      //arange
      await database.insert(PRODUCTS_TABLE, tProduct.toJson());
      //act
      final result = await repository
          .getProductLocal(ProductDatabaseParams(id: tProduct.id));
      //assert
      expect(right(tProduct), result);
      //clean up
      database
        ..delete(PRODUCTS_TABLE)
        ..close();
    });

    test(
        'should return CacheFailure when there is not product with given id in the Database',
        () async {
      String wrongId = 'i do not exist';
      //act
      final result =
          await repository.getProductLocal(ProductDatabaseParams(id: wrongId));

      var failure;
      result.leftMap((l) => failure = l);
      // assert
      expect(result.isLeft(), true);
      expect(failure, isA<CacheFailure>());
      //clean up
      database
        ..delete(PRODUCTS_TABLE)
        ..close();
    });
  });

  group('insert product', () {
    test(
      'should insert product to the database and return unit',
      () async {
        // act
        final result = await repository.insertProduct(tProduct);
        // assert
        expect(result.isRight(), true);

        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
    test(
      'should return CacheFailure when product actually exists in the local database',
      () async {
        //arange
        await repository.insertProduct(tProduct);
        // act
        final result = await repository.insertProduct(tProduct);
        var failure;
        result.leftMap((l) => failure = l);
        // assert
        expect(result.isLeft(), true);
        expect(failure, isA<CacheFailure>());

        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
  });

  group('update product', () {
    test(
      'should update product in the database and return unit when the product exists',
      () async {
        //arange
        await repository.insertProduct(tProduct);
        // act
        final result = await repository.updateProduct(tProduct);
        // assert
        expect(result.isRight(), true);

        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
    test(
      'should return unit when updating nonexistent product ',
      () async {
        // act
        final result = await repository.updateProduct(tProduct);
        // assert
        expect(result.isRight(), true);
        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
  });
  group('delete product', () {
    test(
      'should delete product in the database and return unit when the product exists',
      () async {
        //arange
        await repository.insertProduct(tProduct);
        // act
        final result = await repository.deleteProduct(tProduct);
        // assert
        expect(result.isRight(), true);

        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
    test(
      'should return unit when updating nonexistent product ',
      () async {
        // act
        final result = await repository.deleteProduct(tProduct);
        // assert
        expect(result.isRight(), true);
        //clean up
        database
          ..delete(PRODUCTS_TABLE)
          ..close();
      },
    );
  });
}

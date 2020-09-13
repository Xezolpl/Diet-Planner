import 'dart:developer';

import 'package:diet_planner/core/error/exceptions.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/infrastructure/local_database.dart';
import 'package:injectable/injectable.dart';

///CONSTANTS
const String PRODUCTS_TABLE = 'products';

///ABSTRACTION ON DATASOURCE
abstract class ILocalProductDataSource {
  Future<void> insert(Product product);
  Future<void> update(Product product);
  Future<void> delete(Product product);

  Future<List<Product>> getAllProducts();
  Future<Product> getProduct(ProductDatabaseParams params);
  Future<void> checkOrCache(Product product);
  Future<List<Product>> searchForProducts(ProductQueryParams params);
}

///DATASOURCE
@LazySingleton(as: ILocalProductDataSource)
class LocalProductDataSourceImpl implements ILocalProductDataSource {
  final Database database;

  LocalProductDataSourceImpl(this.database);

  @override
  Future<void> insert(Product product) {
    return database.insert(PRODUCTS_TABLE, product.toJson());
  }

  @override
  Future<void> update(Product product) {
    return database.update(PRODUCTS_TABLE, product.toJson(),
        where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<void> delete(Product product) {
    return database
        .delete(PRODUCTS_TABLE, where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    List<Map<String, dynamic>> records = await database.query(PRODUCTS_TABLE);
    return Future.value(records.map((json) => Product.fromJson(json)).toList());
  }

  @override
  Future<Product> getProduct(ProductDatabaseParams params) async {
    return await database
        .query(PRODUCTS_TABLE,
            where: params.getWhere(), whereArgs: params.getWhereArgs())
        .then<Product>((products) {
      //Its called products because of query syntax but there is allways only one product
      log('Get product from SQLite database by ID: ' + products.toString());
      return Product.fromJson(products.first);
    });
  }

  @override
  Future<void> checkOrCache(Product product) async {
    database.query(PRODUCTS_TABLE,
        where: 'id = ?', whereArgs: [product.id]).then((products) {
      //Its called products because of query syntax but there is allways only one product
      log('Products in database with params: id = ${product.id}' +
          products.toString());
      if (products.length == 0) {
        //cache
        insert(product);
      }
    });
  }

  @override
  Future<List<Product>> searchForProducts(ProductQueryParams params) {
    return database
        .query(PRODUCTS_TABLE,
            where: params.getWhere(), whereArgs: params.getWhereArgs())
        .then<List<Product>>((products) =>
            products.map((json) => Product.fromJson(json)).toList());
  }
}

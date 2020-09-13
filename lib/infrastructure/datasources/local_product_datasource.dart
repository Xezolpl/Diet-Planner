import 'dart:developer';

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
    log('Inserting product: $product');
    return database.insert(PRODUCTS_TABLE, product.toJson());
  }

  @override
  Future<void> update(Product product) {
    log('Updating product: $product');
    return database.update(PRODUCTS_TABLE, product.toJson(),
        where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<void> delete(Product product) {
    log('Deleting product: $product');
    return database
        .delete(PRODUCTS_TABLE, where: 'id = ?', whereArgs: [product.id]);
  }

  @override
  Future<List<Product>> getAllProducts() async {
    log('Get all products called');
    List<Map<String, dynamic>> records = await database.query(PRODUCTS_TABLE);
    return Future.value(records.map((json) => Product.fromJson(json)).toList());
  }

  @override
  Future<Product> getProduct(ProductDatabaseParams params) async {
    log('Getting concrete product for params: $params');
    return await database
        .query(PRODUCTS_TABLE,
            where: params.getWhere(), whereArgs: params.getWhereArgs())
        .then<Product>((products) {
      //Its called products because of query syntax but there is allways only one product
      log('Getting concrete product succed with: ' + products.toString());
      return Product.fromJson(products.first);
    });
  }

  @override
  Future<void> checkOrCache(Product product) async {
    database.query(PRODUCTS_TABLE,
        where: 'id = ?', whereArgs: [product.id]).then((products) {
      //Its called products because of query syntax but there is allways only one product
      log('Check or cache the product called for $product');
      if (products.length == 0) {
        log('Cache product $product');
        insert(product);
      }
    });
  }

  @override
  Future<List<Product>> searchForProducts(ProductQueryParams params) {
    log('Search for products called for params: $params');
    return database
        .query(PRODUCTS_TABLE,
            where: params.getWhere(), whereArgs: params.getWhereArgs())
        .then<List<Product>>((products) {
      log('Products found $products');
      return products.map((json) => Product.fromJson(json)).toList();
    });
  }
}

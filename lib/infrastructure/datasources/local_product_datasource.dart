import 'dart:developer';

import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/infrastructure/local_database.dart';
import 'package:injectable/injectable.dart';

///CONSTANTS
const String PRODUCTS_TABLE = 'products';

///ABSTRACTION ON DATASOURCE
abstract class ILocalProductDataSource {
  Future<Product> getProduct(ProductDatabaseParams params);
  Future<bool> hasProduct(ProductDatabaseParams params);
  Future cacheProduct(Product product);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> searchForProducts(ProductQueryParams params);
}

///DATASOURCE
@LazySingleton(as: ILocalProductDataSource)
class LocalProductDataSourceImpl implements ILocalProductDataSource {
  final Database database;

  LocalProductDataSourceImpl(this.database);

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
  Future<List<Product>> searchForProducts(ProductQueryParams params) {
    // TODO: implement searchForProducts
    return null;
  }

  @override
  Future<void> cacheProduct(Product product) async {
    database.insert(PRODUCTS_TABLE, product.toJson());
  }

  @override
  Future<bool> hasProduct(ProductDatabaseParams params) async {
    return database
        .query(PRODUCTS_TABLE,
            where: params.getWhere(), whereArgs: params.getWhereArgs())
        .then<bool>((products) {
      //Its called products because of query syntax but there is allways only one product
      log('Products in database with params: ${params.toString()}' +
          products.toString());
      return products.length > 0;
    });
  }
}

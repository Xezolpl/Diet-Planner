import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/infrastructure/datasources/sqlite_database.dart';

abstract class LocalProductDataSource {
  Future<Product> getProduct(int barcode);
  Future<bool> hasProduct(int barcode); //TODO: BARCODE OR ID????!?!?!?!?!
  Future cacheProduct(Product product);
  Future<List<Product>> getAllProducts();
  Future<List<Product>> searchForProducts(ProductQueryParams params);
}

const String PRODUCTS_TABLE = 'products';

class LocalProductDataSourceImpl implements LocalProductDataSource {
  final Database database;

  const LocalProductDataSourceImpl(this.database);

  @override
  Future<List<Product>> getAllProducts() async {
    List<Map<String, dynamic>> records = await database.query(PRODUCTS_TABLE);
    List<Product> products = [];

    for (int i = 0; i < records.length; i++) {
      products.add(Product.fromJson(records[i]));
    }
    return Future.value(products);
  }

  @override
  Future<Product> getProduct(int barcode) async {
    //return Future.value(Product.fromJson(
    //    (await database.query('products', where: 'id=$id')).first));
    //TODO: NOT SURE IT WORKS AS EXPECTED
    return database
        .query(PRODUCTS_TABLE, where: 'barcode=$barcode')
        .then((jsonRecords) => Product.fromJson(jsonRecords.first));
  }

  @override
  Future<List<Product>> searchForProducts(ProductQueryParams params) {
    // TODO: implement searchForProducts
    throw UnimplementedError();
  }

  @override
  Future<void> cacheProduct(Product product) async {
    database.insert(PRODUCTS_TABLE, product.toJson());
  }

  @override
  Future<bool> hasProduct(int barcode) async {
    return (await database.query(PRODUCTS_TABLE, where: 'barcode=$barcode'))
            .length >
        0;
  }
}

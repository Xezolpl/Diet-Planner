import 'package:dartz/dartz.dart';
import 'package:diet_planner/domain/core/failures.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
//final ApiProductDataSource apiProductDataSource;
//final DatabaseProductDataSource databaseProductDataSource;
//final LocalProductDataSource localProductDataSource;
//const ProductsRepositoryImpl(this.apiProductDataSource, this.databaseProductDataSource, this.localProductDataSource);

  @override
  Future<Either<Failure, Product>> getProduct(int barcode) async {
    return null;
  }

  @override
  Future<Either<Failure, List<Product>>> searchForProducts(String pattern) {
    // TODO: implement searchForProducts
    throw UnimplementedError();
  }
}

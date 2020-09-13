import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/failures.dart';

abstract class IProductRepository {
  //API
  Future<Either<Failure, Product>> getProductFromApi(int barcode);
  Future<Either<Failure, List<Product>>> searchForProducts(
      ProductQueryParams pattern);

  //LOCAL SQLITE DATABASE
  Future<Either<Failure, Product>> getProductLocal(
      ProductDatabaseParams params);

  //SERVER DATABASE
  Future<Either<Failure, Product>> getProductRemote(
      ProductDatabaseParams params);

  Future<Either<Failure, Unit>> insertProduct(Product product);
  Future<Either<Failure, Unit>> updateProduct(Product product);
  Future<Either<Failure, Unit>> deleteProduct(Product product);
}

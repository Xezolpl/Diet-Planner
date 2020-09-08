import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/failures.dart';

abstract class ProductRepository {
  //API
  Future<Either<Failure, Product>> getProductFromApi(int barcode);
  Future<Either<Failure, List<Product>>> searchForProducts(
      ProductQueryParams pattern);

  //LOCAL SQLITE DATABASE
  Future<Either<Failure, Product>> getProductLocal(int barcode);

  //SERVER DATABASE
  Future<Either<Failure, Product>> getProductRemote(int barcode);
}

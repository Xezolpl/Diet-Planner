import 'package:diet_planner/domain/entities/product.dart';
import 'package:dartz/dartz.dart';
import 'package:diet_planner/domain/core/failures.dart';

abstract class ProductRepository {
  Future<Either<Failure, Product>> getProduct(int barcode);
  Future<Either<Failure, List<Product>>> searchForProducts(String pattern);
}

import 'package:dartz/dartz.dart';
import 'package:diet_planner/domain/core/failures.dart';
import 'package:diet_planner/domain/core/params.dart';
import 'package:diet_planner/domain/core/usecase.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';

class SearchForProductsUseCase
    extends UseCase<List<Product>, ProductQueryParams> {
  final ProductRepository _repository;

  SearchForProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> call(ProductQueryParams params) async {
    return await _repository.searchForProducts(params.name);
  }
}

import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/usecases/usecase.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';

class SearchForProductsUseCase
    extends UseCase<List<Product>, ProductQueryParams> {
  final ProductRepository _repository;

  SearchForProductsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Product>>> call(ProductQueryParams params) async {
    return await _repository.searchForProducts(params);
  }
}

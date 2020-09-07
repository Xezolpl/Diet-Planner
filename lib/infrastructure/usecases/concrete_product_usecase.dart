import 'package:dartz/dartz.dart';
import 'package:diet_planner/domain/core/failures.dart';
import 'package:diet_planner/domain/core/params.dart';
import 'package:diet_planner/domain/core/usecase.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';

class GetConcreteProductUseCase extends UseCase<Product, BarcodeParams> {
  final ProductRepository _repository;

  GetConcreteProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> call(BarcodeParams params) async {
    return await _repository.getProduct(params.barcode);
  }
}

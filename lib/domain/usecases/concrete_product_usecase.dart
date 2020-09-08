import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/usecases/usecase.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';

class GetProductUseCase extends UseCase<Product, BarcodeParams> {
  final ProductRepository _repository;

  GetProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> call(BarcodeParams params) async {
    if (params.fromApi) {
      return await _repository.getProductFromApi(params.barcode);
    } else {
      return await _repository.getProductRemote(params.barcode);
    }
  }
}

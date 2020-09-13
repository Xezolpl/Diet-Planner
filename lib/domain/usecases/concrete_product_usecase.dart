import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/usecases/usecase.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class GetProductUseCase extends UseCase<Product, ProductDatabaseParams> {
  final IProductRepository _repository;

  GetProductUseCase(this._repository);

  @override
  Future<Either<Failure, Product>> call(ProductDatabaseParams params) async {
    if (params.fromApi && params.barcode != null) {
      return await _repository.getProductFromApi(params.barcode);
    } else {
      return await _repository.getProductRemote(params);
    }
  }
}

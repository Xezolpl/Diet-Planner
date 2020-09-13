import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

abstract class IDatabaseProductDataSource {
  Future<Product> getProduct(ProductDatabaseParams params);
}

@Injectable(as: IDatabaseProductDataSource)
class DatabaseProductDataSourceImpl implements IDatabaseProductDataSource {
  @override
  Future<Product> getProduct(ProductDatabaseParams params) {
    //TODO: IMPLEMENT
    return null;
  }
}

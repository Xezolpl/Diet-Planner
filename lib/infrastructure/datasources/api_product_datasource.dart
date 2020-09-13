import 'package:diet_planner/domain/entities/product.dart';
import 'package:injectable/injectable.dart';

abstract class IApiProductDataSource {
  Future<Product> getProduct(int barcode);
}

@LazySingleton(as: IApiProductDataSource)
class ApiProductDataSourceImpl implements IApiProductDataSource {
  @override
  Future<Product> getProduct(int barcode) {
    //TODO: IMPLEMENT
    return null;
  }
}

import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/exceptions.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/network_info.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';
import 'package:diet_planner/infrastructure/datasources/local_product_datasource.dart';

typedef Future<Product> ProductFromDatabaseOrApi();

class ApiProductDataSource {
  Future<Product> getProduct(int barcode) {
    return null;
  }
}

class DatabaseProductDataSource {
  Future<Product> getProduct(int barcode) {
    return null;
  }
}

class ProductRepositoryImpl implements ProductRepository {
  final ApiProductDataSource apiProductDataSource;
  final DatabaseProductDataSource remoteProductDataSource;
  final LocalProductDataSource localProductDataSource;
  final NetworkInfo networkInfo;

  const ProductRepositoryImpl(
      this.apiProductDataSource,
      this.remoteProductDataSource,
      this.localProductDataSource,
      this.networkInfo);

  Future<Either<Failure, Product>> _getProductFromDbOrApi(
      int barcode, ProductFromDatabaseOrApi getFromDbOrApi) async {
    if (await networkInfo.isConnected) {
      try {
        final product = await getFromDbOrApi();
        if (!await localProductDataSource.hasProduct(barcode)) {
          localProductDataSource.cacheProduct(product);
        }
        return Right(product);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      return await getProductLocal(barcode);
    }
  }

  ///It is used to get concrete product if we have internet connection
  @override
  Future<Either<Failure, Product>> getProductFromApi(int barcode) async {
    return await _getProductFromDbOrApi(barcode, () {
      return apiProductDataSource.getProduct(barcode);
    });
  }

  ///It could be used in only two ways
  ///1. To get e.g. Breakfast from database to the app.
  ///2. To get product from section "Yours products"
  @override
  Future<Either<Failure, Product>> getProductRemote(int barcode) async {
    return await _getProductFromDbOrApi(barcode, () {
      return remoteProductDataSource.getProduct(barcode);
    });
  }

  ///Get cached product from SQLite Database
  @override
  Future<Either<Failure, Product>> getProductLocal(int barcode) async {
    try {
      final product = await localProductDataSource.getProduct(barcode);
      return Right(product);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  ///Searching only in Api or local (if offline)
  @override
  Future<Either<Failure, List<Product>>> searchForProducts(
      ProductQueryParams params) async {
    // TODO: implement searchForProducts
    throw UnimplementedError();
  }
}

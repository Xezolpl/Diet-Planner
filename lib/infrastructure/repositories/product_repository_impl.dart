import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:diet_planner/core/error/exceptions.dart';
import 'package:diet_planner/core/error/failures.dart';
import 'package:diet_planner/core/network_info.dart';
import 'package:diet_planner/core/params.dart';
import 'package:diet_planner/domain/entities/product.dart';
import 'package:diet_planner/domain/repositories/products_repository.dart';
import 'package:diet_planner/infrastructure/datasources/api_product_datasource.dart';
import 'package:diet_planner/infrastructure/datasources/database_product_datasource.dart';
import 'package:diet_planner/infrastructure/datasources/local_product_datasource.dart';
import 'package:injectable/injectable.dart';

typedef Future<Product> ProductFromDatabaseOrApi();

@Injectable(as: IProductRepository)
class ProductRepositoryImpl implements IProductRepository {
  final IApiProductDataSource apiProductDataSource;
  final IDatabaseProductDataSource remoteProductDataSource;
  final ILocalProductDataSource localProductDataSource;
  final NetworkInfo networkInfo;

  const ProductRepositoryImpl(
      this.apiProductDataSource,
      this.remoteProductDataSource,
      this.localProductDataSource,
      this.networkInfo);

  Future<Either<Failure, Product>> _getProductFromDbOrApi(
      ProductDatabaseParams params,
      ProductFromDatabaseOrApi getFromDbOrApi) async {
    if (/*await networkInfo.isConnected*/ false) {
      //TODO: CHANGE
      try {
        final product = await getFromDbOrApi();
        if (!await localProductDataSource.hasProduct(params)) {
          localProductDataSource.cacheProduct(product);
        }
        return Right(product);
      } on ApiException {
        return Left(ApiFailure());
      }
    } else {
      return await getProductLocal(params);
    }
  }

  ///It is used to get concrete product if we have internet connection
  @override
  Future<Either<Failure, Product>> getProductFromApi(int barcode) async {
    return await _getProductFromDbOrApi(ProductDatabaseParams(barcode: barcode),
        () {
      return apiProductDataSource.getProduct(barcode);
    });
  }

  ///It could be used in only two ways
  ///1. To get e.g. Breakfast from database to the app.
  ///2. To get product from section "Yours products"
  @override
  Future<Either<Failure, Product>> getProductRemote(
      ProductDatabaseParams params) async {
    return await _getProductFromDbOrApi(params, () {
      return remoteProductDataSource.getProduct(params);
    });
  }

  ///Get cached product from SQLite Database
  @override
  Future<Either<Failure, Product>> getProductLocal(
      ProductDatabaseParams params) async {
    try {
      final product = await localProductDataSource.getProduct(params);
      return Right(product);
    } on Exception catch (e) {
      log(e.toString());
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

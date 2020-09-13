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
import 'package:diet_planner/infrastructure/local_database.dart';
import 'package:injectable/injectable.dart';

///Typedef used to distinc the product is from database (server) or api
typedef Future<Product> ProductFromDatabaseOrApi();

///Implementation of IProductRepository
///It is a class used to communication between product BLoCs and DataSources.
///It gets the data from data sources and returns them as Futures of Either<Failure, ?>
///To create that repository in code prefferably use getIt<IProductRepository>()
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

  ///Shortcut for getProductFromRemote and getProductFromApi functions
  Future<Either<Failure, Product>> _getProductFromDbOrApi(
      ProductDatabaseParams params,
      ProductFromDatabaseOrApi getFromDbOrApi) async {
    if (await networkInfo.isConnected) {
      //if online
      try {
        final product = await getFromDbOrApi();
        //if product is not cached to local database - cache it
        localProductDataSource.checkOrCache(product);
        //if succeed - return the product
        return Right(product);
      } on ApiException catch (e) {
        //If something got wrong in the API
        return Left(ApiFailure(e, 'getProductFromApi()'));
      } on ServerException catch (e) {
        //If something got wrong on server database
        return Left(ServerFailure(e, 'getProductFromRemote()'));
      } on DatabaseException catch (e) {
        //If something got wrong in local database
        return Left(CacheFailure(e, 'checkOrCache()'));
      }
    } else {
      //if offline
      return await getProductLocal(params);
    }
  }

  ///It is used to get concrete product from API.
  ///If offline it will search for product in local database
  @override
  Future<Either<Failure, Product>> getProductFromApi(int barcode) async {
    log('Getting product from API for barcode: $barcode');
    return await _getProductFromDbOrApi(ProductDatabaseParams(barcode: barcode),
        () {
      return apiProductDataSource.getProduct(barcode);
    });
  }

  ///It is used to get product from server database.
  @override
  Future<Either<Failure, Product>> getProductRemote(
      ProductDatabaseParams params) async {
    log('Getting product from server database for params: $params');
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
    } on DatabaseException catch (e) {
      return Left(CacheFailure(e, 'getProductLocal()'));
    }
  }

  ///Searching only in Api or local (if offline)
  @override
  Future<Either<Failure, List<Product>>> searchForProducts(
      ProductQueryParams params) async {
    if (await networkInfo.isConnected) {
      //TODO: Implement searching for products in API
    } else {
      try {
        log('Searching in local database for products with params: $params');
        final products = await localProductDataSource.searchForProducts(params);
        return Right(products);
      } on DatabaseException catch (e) {
        return Left(CacheFailure(e, 'searchForProducts'));
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> insertProduct(Product product) async {
    try {
      await localProductDataSource.insert(product);
      if (await networkInfo.isConnected) {
        //TODOawait remoteProductDataSource.insert(product);
      }
      return Right(unit);
    } on DatabaseException catch (e) {
      return Left(CacheFailure(e, 'insertProduct()'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e, 'insertProduct()'));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(Product product) async {
    try {
      await localProductDataSource.update(product);
      if (await networkInfo.isConnected) {
        //TODOawait remoteProductDataSource.update(product);
      }
      return Right(unit);
    } on DatabaseException catch (e) {
      return Left(CacheFailure(e, 'updateProduct()'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e, 'updateProduct()'));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(Product product) async {
    try {
      await localProductDataSource.delete(product);
      if (await networkInfo.isConnected) {
        //TODOawait remoteProductDataSource.delete(product);
      }
      return Right(unit);
    } on DatabaseException catch (e) {
      return Left(CacheFailure(e, 'deleteProduct()'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e, 'deleteProduct()'));
    }
  }
}

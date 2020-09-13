// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'infrastructure/local_database.dart';
import 'infrastructure/datasources/api_product_datasource.dart';
import 'infrastructure/datasources/database_product_datasource.dart';
import 'infrastructure/datasources/local_product_datasource.dart';
import 'domain/repositories/products_repository.dart';
import 'core/network_info.dart';
import 'infrastructure/repositories/product_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

Future<GetIt> $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) async {
  final gh = GetItHelper(get, environment, environmentFilter);
  final databaseSingleton = _$DatabaseSingleton();
  final database = await databaseSingleton.database;
  gh.factory<Database>(() => database);
  gh.lazySingleton<IApiProductDataSource>(() => ApiProductDataSourceImpl());
  gh.factory<IDatabaseProductDataSource>(() => DatabaseProductDataSourceImpl());
  gh.lazySingleton<ILocalProductDataSource>(
      () => LocalProductDataSourceImpl(get<Database>()));
  gh.factory<NetworkInfo>(() => NetworkInfoImpl());
  gh.factory<IProductRepository>(() => ProductRepositoryImpl(
        get<IApiProductDataSource>(),
        get<IDatabaseProductDataSource>(),
        get<ILocalProductDataSource>(),
        get<NetworkInfo>(),
      ));
  return get;
}

class _$DatabaseSingleton extends DatabaseSingleton {}

import 'dart:developer';

import 'package:diet_planner/infrastructure/db/local_database.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class ApiFailure extends Failure {
  final Exception exception;
  final String methodName;

  ApiFailure(this.exception, this.methodName) {
    log('ApiException caught in $methodName. Error: $exception');
  }

  @override
  List<Object> get props => [exception, methodName];
}

class ServerFailure extends Failure {
  final Exception exception;
  final String methodName;

  ServerFailure(this.exception, this.methodName) {
    log('ServerException caught in $methodName. Error: $exception');
  }

  @override
  List<Object> get props => [exception, methodName];
}

class CacheFailure extends Failure {
  final DatabaseException exception;
  final String methodName;

  CacheFailure(this.exception, this.methodName) {
    log('DatabaseException caught in $methodName. Error: $exception');
  }

  @override
  List<Object> get props => [exception, methodName];
}

import 'dart:html';

import 'package:dartz/dartz.dart';

import 'failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

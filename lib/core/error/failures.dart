import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure(this.message);

  @override
  String toString() => '${this.toString()}. Error message: $message';

  @override
  List<Object> get props => [];
}

class ApiFailure extends Failure {
  ApiFailure(String message) : super(message);
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure(String message) : super(message);
}

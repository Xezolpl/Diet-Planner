import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:injectable/injectable.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@Injectable(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  DataConnectionChecker connectionChecker = DataConnectionChecker();

  @override
  Future<bool> get isConnected => connectionChecker.hasConnection;
}

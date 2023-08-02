import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkConnectionChecker {
  Future<bool> get isConnected;
}

class NetworkConnectionCheckerImpl implements NetworkConnectionChecker {
  final InternetConnectionChecker internetConnectionChecker;

  NetworkConnectionCheckerImpl(this.internetConnectionChecker);

  @override
  Future<bool> get isConnected => internetConnectionChecker.hasConnection;
} 
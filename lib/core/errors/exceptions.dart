class InternetException implements Exception {}

class CancelException implements Exception {}

class NoDataFoundException implements Exception {}

class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class UnExpectedException implements Exception {
  final String message;

  UnExpectedException({required this.message});
}

class UnauthorizedException implements Exception {}

class LocalFileException implements Exception {
  final String message;

  LocalFileException({required this.message});
}

class AccountNotConfirmedException implements Exception {
  AccountNotConfirmedException();
}

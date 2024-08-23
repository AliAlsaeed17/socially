import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

//General failures

class ServerFailure extends Failure {
  const ServerFailure({required message}) : super(message);
}

class LocalFailure extends Failure {
  const LocalFailure({required message}) : super(message);
}

class CancelFailure extends Failure {
  const CancelFailure({required message}) : super(message);
}

class InternetFailure extends Failure {
  const InternetFailure({required String message}) : super(message);
}

class NoDataFoundFailure extends Failure {
  const NoDataFoundFailure({required String message}) : super(message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure({required String message}) : super(message);
}

class UnExpectedFailure extends Failure {
  const UnExpectedFailure({required String message}) : super(message);
}

class LocalFileFailure extends Failure {
  const LocalFileFailure({required String message}) : super(message);
}

class AccountNotConfirmedFailure extends Failure {
  const AccountNotConfirmedFailure({required String message}) : super(message);
}

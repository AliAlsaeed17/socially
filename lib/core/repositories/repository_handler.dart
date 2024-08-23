import 'dart:async';
import 'package:dartz/dartz.dart';
import '../errors/exceptions.dart';
import '../errors/failures.dart';

abstract class RepositoryHandler {
  Future<Either<Failure, T>> handle<T>(Future<T> Function() onHandle);
}

class RepositoryHandlerImpl implements RepositoryHandler {
  @override
  Future<Either<Failure, T>> handle<T>(Future<T> Function() call) async {
    try {
      final result = await call();
      return Right(result);
    } on InternetException {
      return const Left(
        InternetFailure(message: 'no_internet_connection'),
      );
    } on AccountNotConfirmedException {
      return const Left(
          AccountNotConfirmedFailure(message: 'account_not_confirmed'));
    } on NoDataFoundException {
      return const Left(NoDataFoundFailure(
        message: 'no_data_found',
      ));
    } on UnauthorizedException {
      return const Left(UnauthorizedFailure(message: 'unauthorized'));
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return left(UnExpectedFailure(message: e.toString()));
    }
  }
}

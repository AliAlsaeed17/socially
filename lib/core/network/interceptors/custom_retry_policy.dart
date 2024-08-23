import 'package:http_interceptor/http_interceptor.dart';

class CustomRetryPolicy implements RetryPolicy {
  CustomRetryPolicy();
  @override
  int get maxRetryAttempts => 2;

  @override
  Future<bool> shouldAttemptRetryOnException(
      Exception reason, BaseRequest request) {
    return Future.value(true);
  }

  @override
  Future<bool> shouldAttemptRetryOnResponse(BaseResponse response) async {
    return false;
  }

  @override
  Duration delayRetryAttemptOnException({required int retryAttempt}) {
    throw UnimplementedError();
  }

  @override
  Duration delayRetryAttemptOnResponse({required int retryAttempt}) {
    throw UnimplementedError();
  }
}

import 'dart:async';
import 'dart:convert';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:flutter/material.dart';
import 'constant_codes.dart';
import 'models/custom_response.dart';
import 'models/error_response_data.dart';
import 'models/params.dart';
import 'network_info.dart';

abstract class Api {
  Future<void> post<T>(PostParams<T> postParams);

  Future<void> get<T>(GetParams<T> params);

  Future<void> put<T>(PutParams<T> params);

  Future<void> delete<T>(DeleteParams<T> params);
}

const serverUrl = "https://dummyjson.com";
const int timeOutDuration = 60;

class ApiImpl implements Api {
  final InterceptedClient client;
  final NetworkInfo networkInfo;

  Map<String, String> get customAuthorizedHeaders => {
        'content-type': 'application/json',
        'accept': 'application/json',
      };

  ApiImpl({required this.client, required this.networkInfo});

  String get _path => serverUrl;

  @override
  Future<void> get<T>(GetParams<T> params) async {
    if (await networkInfo.isConnected()) {
      try {
        String url = '$_path/${params.url}';
        debugPrint(url);
        final response = await client
            .get(
              Uri.parse(url),
              headers: customAuthorizedHeaders,
            )
            .timeout(const Duration(seconds: timeOutDuration));
        debugPrint('status code get Model ${response.statusCode}');
        debugPrint('body of get Model ${response.body}');
        final customResponse =
            CustomResponse.fromJson(jsonDecode(response.body));
        if (response.statusCode == successCode) {
          params.onSuccess(params.fromJson(customResponse.data));
        } else {
          params.onError(_unSuccessfulResponse(customResponse));
        }
      } on TimeoutException {
        params.onError(
          ErrorResponse(
            statusCode: errorTimeOutCode,
            message: 'error_time_out',
          ),
        );
      } catch (e, s) {
        debugPrint(e.toString());
        debugPrint(s.toString());
        params.onError(
          ErrorResponse(
            statusCode: errorExceptionCode,
            message: 'something_went_wrong',
          ),
        );
      }
    } else {
      params.onError(
        ErrorResponse(
          statusCode: errorTimeOutCode,
          message: 'error_time_out',
        ),
      );
    }
  }

  @override
  Future<void> post<T>(PostParams<T> params) async {
    if (await networkInfo.isConnected()) {
      try {
        String url = '$_path/${params.url}';
        debugPrint(url);
        final response = await client
            .post(
              Uri.parse(url),
              headers: customAuthorizedHeaders,
              body: json.encode(params.body),
            )
            .timeout(const Duration(seconds: timeOutDuration));
        debugPrint('status code post Model ${response.statusCode}');
        debugPrint('body of post Model ${response.body}');

        final customResponse =
            CustomResponse.fromJson(jsonDecode(response.body));
        if (response.statusCode == successCode &&
            customResponse.statusCode == successCode) {
          params.onSuccess(params.fromJson(customResponse.data));
        } else {
          params.onError(_unSuccessfulResponse(customResponse));
        }
      } on TimeoutException {
        params.onError(
          ErrorResponse(
            statusCode: errorTimeOutCode,
            message: 'error_time_out',
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        params.onError(
          ErrorResponse(
            statusCode: errorExceptionCode,
            message: 'something_went_wrong',
          ),
        );
      }
    } else {
      params.onError(
        ErrorResponse(
          statusCode: errorTimeOutCode,
          message: 'error_time_out',
        ),
      );
    }
  }

  @override
  Future<void> put<T>(PutParams<T> params) async {
    if (await networkInfo.isConnected()) {
      try {
        String url = '$_path/${params.url}';
        debugPrint(url);
        final response = await client
            .put(
              Uri.parse(url),
              headers: customAuthorizedHeaders,
              body: json.encode(params.body),
            )
            .timeout(const Duration(seconds: timeOutDuration));
        debugPrint('status code put Model ${response.statusCode}');
        debugPrint('body of put Model ${response.body}');

        final customResponse =
            CustomResponse.fromJson(jsonDecode(response.body));
        if (response.statusCode == successCode &&
            customResponse.statusCode == successCode) {
          params.onSuccess(params.fromJson(customResponse.data));
        } else {
          params.onError(_unSuccessfulResponse(customResponse));
        }
      } on TimeoutException {
        params.onError(
          ErrorResponse(
            statusCode: errorTimeOutCode,
            message: 'error_time_out',
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        params.onError(
          ErrorResponse(
            statusCode: errorExceptionCode,
            message: 'something_went_wrong',
          ),
        );
      }
    } else {
      params.onError(
        ErrorResponse(
          statusCode: errorTimeOutCode,
          message: 'error_time_out',
        ),
      );
    }
  }

  @override
  Future<void> delete<T>(DeleteParams<T> params) async {
    if (await networkInfo.isConnected()) {
      try {
        String url = '$_path/${params.url}';
        debugPrint(url);

        final response = await client
            .delete(
              Uri.parse(url),
              headers: customAuthorizedHeaders,
            )
            .timeout(const Duration(seconds: timeOutDuration));
        debugPrint('status code delete Model ${response.statusCode}');
        debugPrint('body of delete Model ${response.body}');

        final customResponse =
            CustomResponse.fromJson(jsonDecode(response.body));
        if (response.statusCode == successCode &&
            customResponse.statusCode == successCode) {
          params.onSuccess(params.fromJson(customResponse.data));
        } else {
          params.onError(_unSuccessfulResponse(customResponse));
        }
      } on TimeoutException {
        params.onError(
          ErrorResponse(
            statusCode: errorTimeOutCode,
            message: 'error_time_out',
          ),
        );
      } catch (e) {
        debugPrint(e.toString());
        params.onError(
          ErrorResponse(
            statusCode: errorExceptionCode,
            message: 'something_went_wrong',
          ),
        );
      }
    } else {
      params.onError(
        ErrorResponse(
          statusCode: errorTimeOutCode,
          message: 'error_time_out',
        ),
      );
    }
  }

  ErrorResponse _unSuccessfulResponse(CustomResponse customResponse) {
    return ErrorResponse(
      message: customResponse.message,
      statusCode: customResponse.statusCode,
    );
  }
}

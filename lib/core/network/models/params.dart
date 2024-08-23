import 'dart:typed_data';
import 'package:http/http.dart';
import 'error_response_data.dart';

class GetParams<T> {
  final String url;
  final Function(T data) onSuccess;
  final Function(ErrorResponse error) onError;
  final T Function(Map<String, dynamic> jsonData) fromJson;

  GetParams({
    required this.url,
    required this.onSuccess,
    required this.onError,
    required this.fromJson,
  });
}

class PostParams<T> {
  final String url;
  final Map<String, dynamic> body;
  final Function(T data) onSuccess;
  final Function(ErrorResponse error) onError;
  final T Function(Map<String, dynamic> jsonData) fromJson;
  final Function()? onAuthorized;

  PostParams({
    required this.url,
    required this.body,
    required this.onSuccess,
    required this.onError,
    required this.fromJson,
    this.onAuthorized,
  });
}

class DeleteParams<T> {
  final String url;
  final Function(T data) onSuccess;
  final Function(ErrorResponse error) onError;
  final T Function(Map<String, dynamic> jsonData) fromJson;

  DeleteParams({
    required this.url,
    required this.onSuccess,
    required this.onError,
    required this.fromJson,
  });
}

class PutParams<T> {
  final String url;
  final Map<String, dynamic> body;
  final Function(T data) onSuccess;
  final Function(ErrorResponse error) onError;
  final T Function(Map<String, dynamic> jsonData) fromJson;

  PutParams({
    required this.url,
    required this.body,
    required this.onSuccess,
    required this.onError,
    required this.fromJson,
  });
}

class DownloadParams {
  final String url;
  final Function(Uint8List fileBytes) onSuccess;
  final Function(ErrorResponse error) onError;

  DownloadParams({
    required this.url,
    required this.onSuccess,
    required this.onError,
  });
}

class MultipartParams<T> {
  final String url;
  final Map<String, String> body;
  final Function(T data) onSuccess;
  final Function(ErrorResponse error) onError;
  final T Function(Map<String, dynamic> jsonData) fromJson;
  final List<MultipartFile> multipartFiles;
  final String method;

  MultipartParams({
    required this.url,
    required this.body,
    required this.onSuccess,
    required this.onError,
    required this.fromJson,
    required this.multipartFiles,
    this.method = 'POST',
  });
}

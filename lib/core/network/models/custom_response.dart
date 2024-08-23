import 'package:equatable/equatable.dart';

class CustomResponse extends Equatable {
  final int statusCode;
  final Map<String, dynamic> data;
  final String message;

  const CustomResponse({
    required this.statusCode,
    required this.data,
    required this.message,
  });

  @override
  List<Object> get props => [statusCode, data];

  factory CustomResponse.fromJson(Map<String, dynamic> jsonData) {
    return CustomResponse(
      statusCode: 200,
      data: jsonData,
      message: jsonData['message'] ?? jsonData['error'] ?? 'no_message',
    );
  }
}

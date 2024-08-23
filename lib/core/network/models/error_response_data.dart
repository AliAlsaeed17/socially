class ErrorResponse {
  final int statusCode;
  final String message;

  ErrorResponse({
    required this.statusCode,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> jsonData) {
    return ErrorResponse(
      statusCode: jsonData['status'] ?? 500,
      message: jsonData['message'] ?? jsonData['error'] ?? 'no_message',
    );
  }
}

import 'package:dio/dio.dart';

class DioException implements Exception {
  late String message;
  DioException.fromDioError(DioError dioError) {
    Map<DioErrorType, String> errors = {
      DioErrorType.cancel: "Request to API server was cancelled",
      DioErrorType.connectTimeout: "Connection timeout with API server",
      DioErrorType.receiveTimeout:
          "Receive timeout in connection with API server",
      DioErrorType.sendTimeout: "Send timeout in connection with API server",
      DioErrorType.other: dioError.message.contains("SocketException")
          ? "No Internet"
          : "Unexpected error occurred",
      DioErrorType.response: _handleError(
        dioError.response?.statusCode,
        dioError.response?.data,
      ),
    };
    message = errors[dioError.type] ?? dioError.message;
  }

  String _handleError(int? statusCode, dynamic error) {
    Map<int, String> responseErrors = {
      400: error['message'],
      401: 'Unauthorized',
      403: 'Forbidden',
      404: 'unfounde',
      500: 'Internal server error',
      502: 'Bad gateway',
    };
    return responseErrors[statusCode] ?? error.toString();
  }

  @override
  String toString() => message;
}

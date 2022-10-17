import 'package:dio/dio.dart';

import '../api_constant/endpoints.dart';

class DioClient {
  final Dio _dio;

  DioClient(this._dio) {
    _dio.options.baseUrl = Endpoints.baseUrl;
    // _dio.options.connectTimeout = Endpoints.connectTimeOut;
    _dio.options.responseType = Endpoints.responseType;
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        url,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    dynamic data,
  }) async {
    try {
      final response = await _dio.post(
        url,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
        data: data,
        onSendProgress: onSendProgress,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    dynamic data,
  }) async {
    try {
      final response = await _dio.put(
        url,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
        options: options,
        queryParameters: queryParameters,
        data: data,
        onSendProgress: onSendProgress,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
    void Function(int, int)? onSendProgress,
    dynamic data,
  }) async {
    try {
      final response = await _dio.delete(
        url,
        cancelToken: cancelToken,
        options: options,
        queryParameters: queryParameters,
        data: data,
      );
      return response;
    } on Exception {
      rethrow;
    }
  }
}

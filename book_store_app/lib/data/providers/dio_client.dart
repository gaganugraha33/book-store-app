import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: dotenv.env['BASE_URL'] ?? '',
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 3),
        )) {
    _dio.interceptors.add(InterceptorsWrapper(onRequest: (option, handler) {
      log('Request[${option.method}] => PATH: ${option.baseUrl + option.path + option.queryParameters.toString()}');
      return handler.next(option);
    }, onResponse: (response, handler) {
      log('Response[${response.statusCode}] => DATA: ${response.data}');
      return handler.next(response);
    }, onError: (DioException e, handler) {
      log('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
      return handler.next(e);
    }));
  }

  Dio get dio => _dio;
}

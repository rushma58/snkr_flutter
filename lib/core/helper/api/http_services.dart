import 'package:dio/dio.dart';
import 'package:snkr_flutter/core/helper/api/url_services.dart';

class HttpServices {
  static final HttpServices _instance = HttpServices._internal();
  factory HttpServices() => _instance;
  HttpServices._internal();

  static Dio? _dio;

  Dio getDioInstance() {
    if (_dio == null) {
      return _dio = Dio(
        BaseOptions(
          baseUrl: baseUrl,
          connectTimeout: const Duration(milliseconds: 120000),
          receiveTimeout: const Duration(milliseconds: 120000),
        ),
      );
    } else {
      return _dio!;
    }
  }
}

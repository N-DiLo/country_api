import 'dart:developer';

import 'package:country_api/core/services/country_error_handlers.dart';
import 'package:country_api/core/services/interceptors.dart';
import 'package:dio/dio.dart';

const String baseURL = String.fromEnvironment('BASE_URL');

class CountryNetwork {
  static const int serverTIMEOUT = 60;
  static const duration = Duration(seconds: serverTIMEOUT * 10000);

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      connectTimeout: duration,
      receiveTimeout: duration,
    ),
  )..interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final dioOptions = await CountryInterceptors.dioOptions();
        options.headers.addAll(dioOptions.headers ?? {});
        return handler.next(options);
      }, onError: (error, handler) async {
        return handler.next(error);
      }),
      LogInterceptor(
        responseBody: true,
        requestBody: true,
      )
    ]);

  static Future<dynamic> get({
    required String endpoint,
  }) async {
    try {
      final dioOptions = await CountryInterceptors.dioOptions();
      final response = await dio.get(
        endpoint,
        options: Options(
          headers: dioOptions.headers,
        ),
      );
      log(response.data.toString());
      return response.data;
    } on DioException catch (e) {
      _dioHandleError(e);
    }
  }

  static void _dioHandleError(DioException e) {
    if (e.response != null) {
      log('Error Occurred: ${e.response?.data}');
      CountryErrorHandlers.handleDioError(e);
    } else {
      log('Error: ${e.message}');
    }
  }
}

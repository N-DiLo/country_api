import 'dart:developer';

import 'package:country_api/core/services/country_error_handlers.dart';
import 'package:dio/dio.dart';

const String baseURL = String.fromEnvironment('BASE_URL');
const String token = String.fromEnvironment('API_KEY');
bool validToken = token != '' && token.isNotEmpty;

class CountryNetwork {
  static const int serverTIMEOUT = 60;
  static const duration = Duration(seconds: serverTIMEOUT * 10000);

  static Future<Options> _getDioOptions() async {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (validToken) 'Authorization': 'Bearer $token',
    };
    return Options(headers: headers);
  }

  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      connectTimeout: duration,
      receiveTimeout: duration,
    ),
  )..interceptors.addAll([
      InterceptorsWrapper(onRequest: (options, handler) async {
        final dioOptions = await _getDioOptions();
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
      final dioOptions = await _getDioOptions();
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

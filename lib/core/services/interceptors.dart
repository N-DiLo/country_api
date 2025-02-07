import 'package:dio/dio.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class CountryInterceptors {
  static Future<Options> dioOptions() async {
    const String token = String.fromEnvironment('API_KEY');
    bool validToken = token.isNotEmpty && !JwtDecoder.isExpired(token);

    return Options(headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      if (validToken) 'Authorization': 'Bearer $token',
    });
  }
}

import 'package:country_api/core/services/network.dart';
import 'package:dio/dio.dart';

class CountryRepository {
  final Dio dio;

  CountryRepository(this.dio);

  Future<Map<String, dynamic>?> getCountries({int? page}) async {
    // final endpoint = '/countries?page=$page';
    final endpoint = '/all';

    try {
      final response = await CountryNetwork.get(endpoint: endpoint);
      if (response != null) {
        if (response is List) {
          return {'countries': response};
        }
        return response;
      }
      return null;
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}

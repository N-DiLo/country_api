import 'package:country_api/features/country/data/country_repository.dart';

class CountryService {
  final CountryRepository countryRepository;

  CountryService(this.countryRepository);

  Future<Map<String, dynamic>?> getData({int? page}) async {
    try {
      final response = await countryRepository.getCountries(
        page: page,
      );

      return Future.value(response);
    } catch (e) {
      throw Exception('Failed fetch: ${e.toString()}');
    }
  }
}

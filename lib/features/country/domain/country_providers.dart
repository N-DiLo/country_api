import 'package:country_api/core/services/network.dart';
import 'package:country_api/features/country/data/country_repository.dart';
import 'package:country_api/features/country/data/country_service.dart';
import 'package:country_api/features/country/domain/country_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final countryProvider = Provider<CountryRepository>((ref) {
  return CountryRepository(CountryNetwork.dio);
});

final countryServiceProvider = Provider<CountryService>((ref) {
  return CountryService(ref.read(countryProvider));
});

final countryNotifierProvider =
    StateNotifierProvider<CountryNotifier, CountryState>((ref) {
  return CountryNotifier(ref.read(countryServiceProvider));
});

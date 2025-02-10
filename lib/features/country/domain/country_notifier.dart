import 'dart:developer';

import 'package:country_api/features/country/data/country_service.dart';
import 'package:country_api/features/country/data/entities/country_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryState {
  final bool isLoading;
  final bool status;
  final bool isNextPage;
  final String message;
  final CountryModel? countryModel;

  CountryState({
    required this.status,
    required this.message,
    this.isLoading = false,
    this.isNextPage = false,
    this.countryModel,
  });

  CountryState copyWith({
    bool? isLoading,
    bool? isNextPage,
    String? message,
    bool? status,
    CountryModel? countryModel,
  }) =>
      CountryState(
        status: status ?? this.status,
        message: message ?? this.message,
        isNextPage: isNextPage ?? this.isNextPage,
        countryModel: countryModel ?? this.countryModel,
        isLoading: isLoading ?? this.isLoading,
      );
}

class CountryNotifier extends StateNotifier<CountryState> {
  final CountryService countryService;

  CountryNotifier(this.countryService)
      : super(
          CountryState(
            status: false,
            message: 'Fetching data...',
            isLoading: false,
          ),
        );

  Future<void> fetchCountries({int page = 1}) async {
    if (page == 1) {
      state = state.copyWith(isNextPage: false, isLoading: true);
    } else {
      state = state.copyWith(isNextPage: true);
    }

    try {
      final results = await countryService.getData(page: page);
      if (results != null && results.isNotEmpty) {
        final foundCountries = CountryModel.fromJson(results);

        if (page == 1) {
          state = state.copyWith(
            countryModel: foundCountries,
            isLoading: false,
            status: true,
            message: 'Country data fetched',
          );
        } else {
          final oldCountriesFound = state.countryModel?.data ?? [];
          final newFoundCountries = foundCountries.data ?? [];

          state = state.copyWith(
            isNextPage: false,
            countryModel: CountryModel(
              data: [
                ...oldCountriesFound,
                ...newFoundCountries,
              ],
            ),
          );
        }
      } else {
        state = state.copyWith(
          isLoading: false,
          isNextPage: false,
          status: false,
          message: 'No more countries found',
        );
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isNextPage: false,
        status: false,
        message: 'Error occurred: ${e.toString()}',
      );
      log('Error fetching data: $e');
      throw Exception('Error occurred: $e');
    }
  }
}

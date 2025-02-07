import 'package:country_api/core/shared/widgets/country_app_bar.dart';
import 'package:country_api/features/country/domain/country_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryList extends ConsumerStatefulWidget {
  const CountryList({super.key});
  static const routeName = '/country-home';

  @override
  ConsumerState<CountryList> createState() => _CountryListState();
}

class _CountryListState extends ConsumerState<CountryList> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.watch(countryNotifierProvider.notifier).fetchCountries();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CountryAppBar(
        title: 'Explore',
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryDetails extends ConsumerStatefulWidget {
  const CountryDetails({super.key});
  static const routeName = '/details';

  @override
  ConsumerState<CountryDetails> createState() => _StateCountryDetails();
}

class _StateCountryDetails extends ConsumerState<CountryDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CountryText(
            text: 'Details Page',
            style: bodyLarge,
          )
        ],
      ),
    );
  }
}

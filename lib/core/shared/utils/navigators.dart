import 'package:country_api/features/country/presentation/country_details.dart';
import 'package:country_api/features/country/presentation/country_list.dart';
import 'package:flutter/material.dart';

class CountryNavigators {
  static const countryHome = CountryList.routeName;
  static const countryDetails = CountryDetails.routeName;

  static Map<String, WidgetBuilder> get routes {
    return {
      countryHome: (context) => CountryList(),
      countryDetails: (context) => CountryDetails(),
    };
  }
}

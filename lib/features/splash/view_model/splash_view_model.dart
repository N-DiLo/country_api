import 'package:country_api/core/shared/utils/navigators.dart';
import 'package:flutter/material.dart';

class SplashViewModel {
  void navToCountryHome({required BuildContext context}) async {
    await Future.delayed(Duration(seconds: 3)).then((_) {
      if (context.mounted) {
        Navigator.popAndPushNamed(
          context,
          CountryNavigators.countryHome,
        );
      }
    });
  }
}

import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:country_api/features/splash/view_model/splash_view_model.dart';
import 'package:flutter/material.dart';

class CountrySplash extends StatefulWidget {
  const CountrySplash({super.key});

  @override
  State<CountrySplash> createState() => _CountrySplashState();
}

class _CountrySplashState extends State<CountrySplash> {
  final splashVM = SplashViewModel();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (mounted) {
        splashVM.navToCountryHome(context: context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              startUpImg,
              scale: 2.0,
            ),
            CountryText(
              text: 'Know World Countries...',
              style: bodyMedium.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            CountryText(
              text: 'explore, learn, and connect with every nation.',
              style: bodySmall.copyWith(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

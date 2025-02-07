import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/shared/utils/navigators.dart';
import 'package:country_api/features/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:toastification/toastification.dart';

final GlobalKey<NavigatorState> navigationKey = GlobalKey();

void main() {
  runApp(ProviderScope(child: const MyApp()));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        navigatorKey: navigationKey,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: orangeColor,
          ),
          useMaterial3: true,
        ),
        home: CountrySplash(),
        routes: CountryNavigators.routes,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CountryList extends StatelessWidget {
  const CountryList({super.key});
  static const routeName = '/country-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
        ),
      ),
    );
  }
}

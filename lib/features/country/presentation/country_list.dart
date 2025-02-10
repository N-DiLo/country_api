import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_sizes.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:country_api/core/shared/widgets/country_app_bar.dart';
import 'package:country_api/core/shared/widgets/country_input.dart';
import 'package:country_api/features/country/domain/country_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    final provider = ref.watch(countryNotifierProvider);
    final loader = provider.isLoading;
    final list = provider.countryModel?.data ?? [];
    return Scaffold(
      appBar: CountryAppBar(
        title: 'Explore',
        centerTitle: false,
        actions: [_toggleTheme(onPressed: () {})],
      ),
      backgroundColor: whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: cWidth(context, .04)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: cHeight(context, .02)),
              CountryInput(
                leading: Icon(
                  Icons.search_outlined,
                  color: greyColor[200],
                ),
                hintStyle: bodyMedium.copyWith(
                  color: greyColor[200],
                  fontWeight: FontWeight.w300,
                ),
                hintText: 'Search Country',
              ),
              SizedBox(height: cHeight(context, .02)),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: cHeight(context, .5),
                  ),
                  child: ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) {
                        final avCountry = list[index];
                        final flags = avCountry.href?.flag ?? '';
                        final names = avCountry.name ?? '';
                        final capitals = avCountry.capital ?? '';
                        return Skeletonizer(
                          enabled: loader,
                          child: countryTile(
                            flag: flags,
                            capital: capitals,
                            name: names,
                            onTap: () {},
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _toggleTheme({
  required void Function() onPressed,
  bool isDark = false,
}) {
  return IconButton(
    onPressed: onPressed,
    icon: Icon(
      isDark ? Icons.brightness_4 : Icons.brightness_4_outlined,
    ),
  );
}

Widget countryTile({
  required String flag,
  required String capital,
  required String name,
  required void Function() onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(flag),
        ),
      ),
    ),
    title: CountryText(
      text: name,
      style: bodyMedium,
    ),
    subtitle: CountryText(
      text: capital,
      style: bodySmall.copyWith(
        color: greyColor[200],
      ),
    ),
  );
}

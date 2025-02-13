import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_sizes.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:country_api/core/shared/utils/open_modal.dart';
import 'package:country_api/core/shared/widgets/country_app_bar.dart';
import 'package:country_api/core/shared/widgets/country_input.dart';
import 'package:country_api/features/country/data/entities/country_model.dart';
import 'package:country_api/features/country/domain/country_providers.dart';
import 'package:country_api/features/country/presentation/widgets/filter_modal.dart';
import 'package:country_api/features/country/presentation/widgets/lang_modal.dart';
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

  List<CountryModel> _filter = [];
  String _search = '';

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(countryNotifierProvider);
    final loader = provider.isLoading;
    final list = provider.countryModel ?? [];

    _filter = _search.isEmpty
        ? list
        : list
            .where((e) =>
                e.name?.official?.toLowerCase().contains(_search) ?? false)
            .toList();

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
                onChanged: (value) =>
                    setState(() => _search = value.trim().toLowerCase()),
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
              SizedBox(height: cHeight(context, .015)),
              _rowBtns(
                  tapped: (index) => index == 0
                      ? OpenModal().openModals(
                          context: context,
                          child: LangModal(),
                        )
                      : OpenModal().openModals(
                          context: context,
                          child: FilterModal(),
                        ),
                  title: ['EN', 'Filter'],
                  icons: [
                    Icons.abc,
                    Icons.filter_alt_outlined,
                  ],
                  context: context),
              SizedBox(height: cHeight(context, .01)),
              Flexible(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: cHeight(context, .7),
                  ),
                  child: ListView.builder(
                      itemCount: _filter.length,
                      itemBuilder: (context, index) {
                        final avCountry = _filter[index];
                        final flags = avCountry.flag ?? '';
                        final names = avCountry.name?.official ?? '';
                        final capitals = avCountry.capital![index];
                        return Skeletonizer(
                          enabled: loader,
                          child: _countryTile(
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

Widget _countryTile({
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

Widget _rowBtns({
  required void Function(int index) tapped,
  required List<String> title,
  required List<IconData> icons,
  required BuildContext context,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(title.length, (index) {
      final text = title[index];
      final icon = icons[index];
      return GestureDetector(
        onTap: () => tapped(index),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          constraints: BoxConstraints(
            maxHeight: cHeight(context, .045),
            minWidth: cWidth(context, .10),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: whiteColor,
            border: Border.all(
              color: Color(0xffA9B8D4),
            ),
          ),
          child: Text.rich(
            TextSpan(children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(
                  icon,
                  color: textColor,
                ),
              ),
              TextSpan(
                text: ' $text',
                style: bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              )
            ]),
          ),
        ),
      );
    }),
  );
}

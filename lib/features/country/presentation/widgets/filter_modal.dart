import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterModal extends ConsumerStatefulWidget {
  const FilterModal({super.key});

  @override
  ConsumerState<FilterModal> createState() => _StateFilterModal();
}

class _StateFilterModal extends ConsumerState<FilterModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountryText(
        text: 'Filter Modal',
        style: bodyMedium,
      ),
    );
  }
}

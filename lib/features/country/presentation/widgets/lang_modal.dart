import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LangModal extends ConsumerStatefulWidget {
  const LangModal({super.key});

  @override
  ConsumerState<LangModal> createState() => _LangModalState();
}

class _LangModalState extends ConsumerState<LangModal> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CountryText(
        text: 'Language Modal',
        style: bodyMedium,
      ),
    );
  }
}

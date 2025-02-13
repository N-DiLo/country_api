import 'package:country_api/core/constants/country_color.dart';
import 'package:flutter/material.dart';

class OpenModal {
  Future<void> openModals({
    required BuildContext context,
    required Widget child,
    bool useRootNavigator = false,
    bool isScrollControlled = false,
    bool enableDrag = false,
    bool isDismissible = false,
    bool useSafeArea = false,
    BoxConstraints? constraints,
  }) async {
    await showModalBottomSheet(
        useSafeArea: useSafeArea,
        useRootNavigator: useRootNavigator,
        isScrollControlled: isScrollControlled,
        isDismissible: isDismissible,
        enableDrag: enableDrag,
        context: context,
        builder: (_) {
          return Container(
            padding: EdgeInsets.all(10.0),
            constraints: constraints,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: child,
          );
        });
  }
}

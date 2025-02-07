import 'package:country_api/core/shared/utils/country_text.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class CountryToast {
  static void showToast({
    BuildContext? context,
    TextStyle? style,
    bool? showIcon,
    ToastificationStyle? toastStyle,
    required String message,
    ToastificationType type = ToastificationType.error,
    Duration autoCloseDuration = const Duration(seconds: 2),
  }) {
    switch (type) {
      case ToastificationType.success:
        break;
      case ToastificationType.error:
        break;
      case ToastificationType.info:
      default:
        break;
    }

    toastification.show(
      closeOnClick: false,
      showIcon: showIcon,
      style: toastStyle,
      context: context,
      type: type,
      autoCloseDuration: autoCloseDuration,
      title: CountryText(
        style: style,
        text: message,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

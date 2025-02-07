import 'package:country_api/core/constants/country_color.dart';
import 'package:country_api/core/constants/country_text_styles.dart';
import 'package:country_api/core/shared/widgets/country_toast.dart';
import 'package:dio/dio.dart';
import 'package:toastification/toastification.dart';

class CountryErrorHandlers {
  static bool _timeoutOccurred = false;
  static bool get timeoutOccurred => _timeoutOccurred;

  static void handleDioError(DioException e) {
    String message = _getErrorMessage(e);

    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      _timeoutOccurred = true;
    }

    CountryToast.showToast(
      showIcon: false,
      autoCloseDuration: const Duration(seconds: 3),
      message: message,
      style: bodyText.copyWith(color: whiteColor),
      toastStyle: ToastificationStyle.fillColored,
      type: ToastificationType.error,
    );
  }

  static String _getErrorMessage(DioException e) {
    if (e.response != null) {
      final result = e.response?.data;
      switch (e.response?.statusCode) {
        case 404:
          return result?['error'] ?? result?['message'] ?? 'Page not found';
        case 400:
          return result?['error'] ??
              result?['message'] ??
              'Bad request: Please provide all fields';
        case 401:
          return result?['error'] ??
              result?['message'] ??
              'Invalid credentials: please try again';
        case 310:
          return result?['error'] ??
              result?['message'] ??
              'Email verification failed';
        case 500:
          return result?['error'] ??
              result?['message'] ??
              'Something went wrong on the server';
        default:
          return result?['message'] ??
              result?['error'] ??
              'An unexpected error occurred. Please try again.';
      }
    } else {
      return _handleTimeoutErrors(e);
    }
  }

  static String _handleTimeoutErrors(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timed out. Please try again.';
    } else if (e.type == DioExceptionType.receiveTimeout) {
      return 'Response timed out. Please try again.';
    } else if (e.type == DioExceptionType.connectionError) {
      return 'Connection failed. The server might be down or unreachable.';
    } else if (e.type == DioExceptionType.unknown) {
      return 'No internet connection or server is unreachable.';
    } else {
      return 'Unexpected error. Please try again.';
    }
  }

  static void resetTimeoutState() {
    _timeoutOccurred = false;
  }
}

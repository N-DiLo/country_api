import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static const apiKEY = 'api_KEY';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(apiKEY, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(apiKEY);
  }
}

import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  static String authToken = 'token_key';

  static Future<void> storeToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(authToken, token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(authToken);
  }
}

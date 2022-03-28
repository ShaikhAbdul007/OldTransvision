import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  static String userNameKey = "userNameKey";
  static dynamic passwordKey = "passwordKey";

  static Future<bool> saveUserName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, username);
  }

  static Future<bool> savePassword(String password) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(passwordKey, password);
  }
}

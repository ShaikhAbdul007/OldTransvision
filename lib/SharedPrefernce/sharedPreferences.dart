import 'package:shared_preferences/shared_preferences.dart';

class LoginData {
  static dynamic userNameKey = "userNameKey";
          //set the data
  static Future<bool> saveUserName(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.setString(userNameKey, username);
  }
        //get the data
 static  Future<dynamic> getUserName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return await preferences.getString(userNameKey);
  }

}
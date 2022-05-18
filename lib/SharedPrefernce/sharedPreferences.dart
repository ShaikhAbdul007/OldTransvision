import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  late SharedPreferences prefs;

  save(username) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString('user', username);
  }

  retrieveUserName() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('user');
  }

  void checkUserLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    String? val = prefs.getString("user");
    if (val != null) {
      "route";
    } else {
      "route";
    }
  }
}

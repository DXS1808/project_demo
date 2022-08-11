import 'package:shared_preferences/shared_preferences.dart';

class LanguageLocal {
  static Future<bool> setLanguagesCode(String languagesCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("languages", languagesCode);
  }
  static Future<String?> getLanguagesCode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("languages");
  }
}
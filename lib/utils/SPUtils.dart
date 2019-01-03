import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  static Future<String> getString(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getString(key);
  }

  static Future<List<String>> getStringList(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getStringList(key);
  }

  static Future<bool> getBool(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getBool(key);
  }

  static Future<double> getDouble(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getDouble(key);
  }

  static Future<int> getInt(String key) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    return share.getInt(key);
  }

  static Future setString(String key, String value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setString(key, value);
  }

  static Future setStringList(String key, List<String> value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setStringList(key, value);
  }

  static Future setBool(String key, bool value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setBool(key, value);
  }

  static Future setDouble(String key, double value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setDouble(key, value);
  }

  static Future setInt(String key, int value) async {
    SharedPreferences share = await SharedPreferences.getInstance();
    await share.setInt(key, value);
  }

  static Future clear() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.clear();
  }

}

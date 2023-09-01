import 'package:shared_preferences/shared_preferences.dart';

class helper {
  static SharedPreferences? sharedprefrance;
  static init() async {
    sharedprefrance = await SharedPreferences.getInstance();
  }

  static Future<bool> savedata(
      {required String key, required dynamic value}) async {
    if (value is String) {
      return sharedprefrance!.setString(key, value);
    }
    if (value is int) {
      return sharedprefrance!.setInt(key, value);
    }
    if (value is bool) {
      return sharedprefrance!.setBool(key, value);
    }
    return sharedprefrance!.setDouble(key, value);
  }

  static Future<dynamic> getdata({
    required String key,
  }) async {
    return await sharedprefrance!.get(key) == null
        ? false
        : sharedprefrance!.get(key);
  }

  static Future<bool> remove({
    required String key,
  }) async {
    return await sharedprefrance!.remove(key);
  }
}

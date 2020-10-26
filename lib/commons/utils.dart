

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {

  static Future <SharedPreferences> get _instance async => _prefsInstance ??= await SharedPreferences.getInstance ();
  static SharedPreferences _prefsInstance;

  static Future <SharedPreferences> init () async {

    _prefsInstance = await _instance;
    return _prefsInstance;
  }

  static String getString (String key, [String defValue]) {

    return _prefsInstance.getString (key) ?? defValue ?? "";
  }

  static Future <bool> setString (String key, String value) async {

    var prefs = await _instance;

    return prefs?.setString (key, value) ?? Future.value (null);
  }

  static Future <bool> setInt (String key, int value) async {

    var prefs = await _instance;

    return prefs?.setInt (key, value) ?? Future.value (null);
  }

  static int getInt (String key, [int defValue]) {

    return _prefsInstance.getInt (key) ?? defValue ?? 0;
  }
}
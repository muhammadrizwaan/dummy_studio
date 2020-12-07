import 'dart:async' show Future;
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

  static Future <bool> setDouble (String key, double value) async {
    var prefs = await _instance;
    return prefs?.setDouble (key, value) ?? Future.value (null);
  }

  static double getDouble (String key, [double defValue]) {
    return _prefsInstance.getDouble (key) ?? defValue ?? 0;
  }

}
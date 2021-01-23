import 'package:shared_preferences/shared_preferences.dart';

class UserData{
  static SharedPreferences _sharedPrefs;
  static init() async {
    if (_sharedPrefs == null) {
      _sharedPrefs = await SharedPreferences.getInstance();
    }
  }
  static Future<bool> setEmail(String key, String value) {
    if ( _sharedPrefs == null) return null;
    return  _sharedPrefs.setString(key, value);
  }
  static String getEmail(String key, {String defValue = ''}) {
    if (_sharedPrefs == null) return defValue;
    return _sharedPrefs.getString(key) ?? defValue;
  }
  static Future<bool> setPass(String key, String value) {
    if ( _sharedPrefs == null) return null;
    return  _sharedPrefs.setString(key, value);
  }
  static String getPass(String key, {String defValue = ''}) {
    if (_sharedPrefs == null) return defValue;
    return _sharedPrefs.getString(key) ?? defValue;
  }
  static Future<bool> setPhone(String key, String value) {
    if ( _sharedPrefs == null) return null;
    return  _sharedPrefs.setString(key, value);
  }
  static String getPhone(String key, {String defValue = ''}) {
    if (_sharedPrefs == null) return defValue;
    return _sharedPrefs.getString(key) ?? defValue;
  }
  static Future<bool> setName(String key, String value) {
    if ( _sharedPrefs == null) return null;
    return  _sharedPrefs.setString(key, value);
  }
  static String getName(String key, {String defValue = ''}) {
    if (_sharedPrefs == null) return defValue;
    return _sharedPrefs.getString(key) ?? defValue;
  }
}
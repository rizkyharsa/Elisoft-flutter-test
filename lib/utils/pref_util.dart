import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static const String _keyName = 'name';
  static const String _keyEmail = 'email';

  Future<void> saveSession(String name, String email) async {
    final pref = await SharedPreferences.getInstance();
    await pref.setString(_keyName, name);
    await pref.setString(_keyEmail, email);
  }

  Future<String?> getName() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_keyName);
  }

  Future<String?> getEmail() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(_keyEmail);
  }
}

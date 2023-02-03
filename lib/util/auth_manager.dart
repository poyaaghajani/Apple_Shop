import 'package:book_shop/di/di.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  static final ValueNotifier<String?> authChangeNotifire = ValueNotifier(null);
  static final SharedPreferences _sharedPref = locator.get();

  static void savedToken(String token) async {
    _sharedPref.setString('access_token', token);
    authChangeNotifire.value = token;
  }

  static String ReadAuth() {
    return _sharedPref.getString('access token') ?? '';
  }

  static void Logout() {
    _sharedPref.clear();
    authChangeNotifire.value = null;
  }
}

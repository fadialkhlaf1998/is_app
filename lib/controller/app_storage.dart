import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';

class AppStorage {
  static Future saveUserToSharedPreferences(UserData user) async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = jsonEncode(user.toJson());
    await prefs.setString('userData', userJson);
  }

  static Future<UserData?> getUserFromSharedPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString('userData');
    if (userJson != null) {
      final userMap = jsonDecode(userJson);
      return UserData.fromJson(userMap);
    }
    return null;
  }

  static Future deleteUserData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('userData');
    await prefs.remove('userEmail');
    await prefs.remove('userPassword');
  }

  static Future saveEmailPassword(email, password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userEmail', email);
    await prefs.setString('userPassword', password);
  }

  static Future<String> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('userEmail') ?? '';
    return email;
  }

  static Future<String> getUserPassword() async {
    final prefs = await SharedPreferences.getInstance();
    final pass = prefs.getString('userPassword') ?? '';
    return pass;
  }

  static Future saveLanguage(String lang) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', lang);
  }

  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String lang = await prefs.getString('language') ?? 'en';
    return lang;
  }
}

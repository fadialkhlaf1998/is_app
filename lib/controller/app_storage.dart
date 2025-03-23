import 'dart:convert';
import 'package:is_app/data/models/response/cart/cart_response.dart';
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
  static setVerificationCode(int verification_code) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('verification_code',verification_code);
  }
  static Future<int> getVerificationCode() async {
    final prefs = await SharedPreferences.getInstance();
    final pass = prefs.getInt('verification_code') ?? 0;
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

  static Future saveBadgeStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('badgeStatus', status);
  }

  static Future<bool> getBadgeStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool status = await prefs.getBool('badgeStatus') ?? false;
    return status;
  }

  static Future<void> saveCartList(List<Cart> cartList) async {
    final prefs = await SharedPreferences.getInstance();
    String cartJson = jsonEncode(cartList.map((e) => e.toJson()).toList());
    await prefs.setString('cartStatus', cartJson);
  }

  static Future<List<Cart>> getCartList() async {
    final prefs = await SharedPreferences.getInstance();
    String? cartJson = prefs.getString('cartStatus');
    if (cartJson != null) {
      List<dynamic> decoded = jsonDecode(cartJson);
      return decoded.map((e) => Cart.fromJson(e)).toList();
    }
    return [];
  }
}

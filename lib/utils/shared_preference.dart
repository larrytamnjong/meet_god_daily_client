import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SharedPreference {
  static Future<bool> addToSharedPreferences(User user) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('id', user.id.toString());
      await prefs.setString('fullName', user.fullName!);
      await prefs.setString('phone', user.phone!);
      await prefs.setString('email', user.email!);
      await prefs.setString('creationDate', user.creationDate!);
      return true;
    } catch (e) {
      debugPrint("Add to Shared Preference Error: ${e.toString()}");
      return false;
    }
  }

  static Future<User?> getUserFromSharedPreference() async {
    final prefs = await SharedPreferences.getInstance();
    User user = User(
      id: int.parse(prefs.getString('id')!),
      phone: prefs.getString('phone'),
      email: prefs.getString('email'),
      fullName: prefs.getString('fullName'),
      creationDate: prefs.getString('creationDate'),
    );

    return user;
  }

  static Future<String?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('id');
  }

  static logOutUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('id');
    await prefs.remove('phone');
    await prefs.remove('email');
    await prefs.remove('fullName');
    await prefs.remove('creationDate');
  }
}

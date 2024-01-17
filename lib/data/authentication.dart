import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meet_god_daily_client/constants/api_urls.dart';

import '../models/user.dart';

class AuthenticationClient {
  User user;

  AuthenticationClient({required this.user});

  Future<User?> login() async {
    try {
      final response =
          await http.post(Uri.parse(loginUrl), body: jsonEncode(user.toJson()));
      if (response.statusCode == 200) {
        return User.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error occurred in request");
      }
    } catch (exception) {
      return null;
    }
  }

  Future<bool> register() async {
    try {
      final response = await http.post(Uri.parse(registrationUrl),
          body: jsonEncode(user.toJson()));
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (exception) {
      return false;
    }
  }
}

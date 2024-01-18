import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:meet_god_daily_client/constants/api_urls.dart';

import '../models/devotion.dart';

class DevotionClient {
  Future<Devotion?> getTodayDevotion({required String id}) async {
    try {
      final response = await http.get(Uri.parse('$todayDevotion$id'));
      if (response.statusCode == 200) {
        return Devotion.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Error occurred in request");
      }
    } catch (exception) {
      return null;
    }
  }
}

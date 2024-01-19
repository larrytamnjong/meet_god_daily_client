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
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Future<List<MonthDevotions>?> getPastDevotions() async {
    try {
      final response = await http.get(Uri.parse(pastDevotions));
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = jsonDecode(response.body);
        List<MonthDevotions> organizedDevotions =
            organizeDevotionsByMonth(jsonResponse);
        return organizedDevotions;
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }
}

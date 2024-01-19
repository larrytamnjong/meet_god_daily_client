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

  Future<List<Devotion>?> getPastDevotions() async {
    try {
      final response = await http.get(Uri.parse(pastDevotions));
      if (response.statusCode == 200) {
        List<dynamic> decodedData = jsonDecode(response.body);
        List<Devotion> devotions = decodedData
            .map((devotion) =>
                Devotion.fromJson(devotion as Map<String, dynamic>))
            .toList();
        return devotions;
      } else {
        throw Exception("Error in getting past devotions");
      }
    } catch (exception) {
      return null;
    }
  }
}

import 'package:get/get.dart';
import 'package:meet_god_daily_client/data/devotion.dart';

import '../../models/devotion.dart';

class DevotionController extends GetxController {
  late DevotionClient devotionClient;

  DevotionController() {
    devotionClient = DevotionClient();
  }

  Future<Devotion?> getTodayDevotion() async {
    Devotion? todayDevotion = await devotionClient.getTodayDevotion(id: "7");
    if (todayDevotion != null) {
      return todayDevotion;
    } else {
      return null;
    }
  }

  Future<List<MonthDevotions>?> getPastDevotions() async {
    List<MonthDevotions>? devotions = await devotionClient.getPastDevotions();
    if (devotions != null) {
      return devotions;
    } else {
      return null;
    }
  }
}

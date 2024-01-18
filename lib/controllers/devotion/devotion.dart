import 'package:get/get.dart';
import 'package:meet_god_daily_client/data/devotion.dart';

import '../../models/devotion.dart';

class DevotionController extends GetxController {
  late DevotionClient devotionClient;

  DevotionController() {
    devotionClient = DevotionClient();
  }

  var isLoadingDevotion = false.obs;

  Future<Devotion?> getTodayDevotion() async {
    _startProgressIndicator();
    Devotion? todayDevotion = await devotionClient.getTodayDevotion(id: "7");
    if (todayDevotion != null) {
      _stopProgressIndicator();
      return todayDevotion;
    } else {
      _stopProgressIndicator();
      return null;
    }
  }

  void _startProgressIndicator() {
    isLoadingDevotion.value = true;
  }

  void _stopProgressIndicator() {
    isLoadingDevotion.value = false;
  }
}

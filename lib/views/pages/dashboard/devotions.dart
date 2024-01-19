import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/controllers/devotion/devotion.dart';
import 'package:meet_god_daily_client/utils/date_fomatter.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/read_devotion.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

import '../../../models/devotion.dart';
import '../../widgets/widgets/errors.dart';

class PastDevotionsScreen extends StatefulWidget {
  const PastDevotionsScreen({super.key});

  @override
  State<PastDevotionsScreen> createState() => _PastDevotionsScreenState();
}

class _PastDevotionsScreenState extends State<PastDevotionsScreen> {
  DevotionController devotionController = DevotionController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Devotions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Devotion>?>(
            future: devotionController.getPastDevotions(),
            builder: (context, devotions) {
              if (devotions.hasData) {
                return CustomAccordion(
                  title: 'January',
                  headerBackgroundColor: Colors.lightGreen.withOpacity(0.8),
                  titleStyle: largeHeadingStyle.copyWith(
                      color: Colors.white, fontSize: 16.5),
                  toggleIconOpen: Icons.keyboard_arrow_down_sharp,
                  toggleIconClose: Icons.keyboard_arrow_up_sharp,
                  headerIconColor: Colors.white,
                  accordionElevation: 0,
                  widgetItems: SizedBox(
                    height: 500,
                    child: ListView.builder(
                      itemCount: devotions.data!.length,
                      itemBuilder: (BuildContext context, int index) => Card(
                        child: ListTile(
                          leading: const Icon(Icons.calendar_month),
                          title: Text(formatDateString(
                              devotions.data![index].messageDate)),
                          subtitle: Text(devotions.data![index].devotionTitle),
                          onTap: () {
                            Get.to(() =>
                                ReadDevotion(devotion: devotions.data![index]));
                          },
                        ),
                      ),
                    ),
                  ),
                );
              } else if (devotions.hasError) {
                return const NoDevotionFound();
              } else if (devotions.connectionState == ConnectionState.waiting) {
                return const Center(child: LinearProgressIndicator());
              } else {
                return const NoDevotionFound();
              }
            }),
      ),
    );
  }
}

import 'package:custom_accordion/custom_accordion.dart';
import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/controllers/devotion/devotion.dart';
import 'package:meet_god_daily_client/views/widgets/styles/custom_colors.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

import '../../../models/devotion.dart';
import '../../widgets/widgets/containers.dart';
import '../../widgets/widgets/errors.dart';

class PastDevotionsScreen extends StatefulWidget {
  const PastDevotionsScreen({super.key});

  @override
  State<PastDevotionsScreen> createState() => _PastDevotionsScreenState();
}

class _PastDevotionsScreenState extends State<PastDevotionsScreen> {
  DevotionController devotionController = DevotionController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Devotions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<MonthDevotions>?>(
            future: devotionController.getPastDevotions(),
            builder: (context, devotions) {
              if (devotions.hasData) {
                return ListView.builder(
                    itemCount: devotions.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomAccordion(
                        backgroundColor: monthColors[index],
                        headerBackgroundColor: monthColorsMain[index],
                        widgetItemsPadding:
                            const EdgeInsets.symmetric(horizontal: 2.5),
                        title: devotions.data![index].month,
                        titleStyle: largeHeadingStyle.copyWith(
                            color: Colors.white, fontSize: 16.5),
                        toggleIconOpen: Icons.keyboard_arrow_down_sharp,
                        toggleIconClose: Icons.keyboard_arrow_up_sharp,
                        headerIconColor: Colors.white,
                        accordionElevation: 0,
                        widgetItems: SizedBox(
                          height: MediaQuery.sizeOf(context).height / 0.9,
                          child: DevotionCardBuilder(
                            devotions: devotions.data![index].devotions,
                          ),
                        ),
                      );
                    });
              } else if (devotions.hasError) {
                return const InternalError();
              } else if (devotions.connectionState == ConnectionState.waiting) {
                return const LinearProgressIndicator();
              } else {
                return const InternalError();
              }
            }),
      ),
    );
  }
}

class DevotionCardBuilder extends StatelessWidget {
  final List<Devotion> devotions;
  const DevotionCardBuilder({
    super.key,
    required this.devotions,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: devotions.length,
      itemBuilder: (BuildContext context, int index) => DevotionCard(
        devotion: devotions[index],
      ),
    );
  }
}

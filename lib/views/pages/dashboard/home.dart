import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/controllers/devotion/devotion.dart';
import 'package:meet_god_daily_client/utils/date_fomatter.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/containers.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/texts.dart';

import '../../../models/devotion.dart';
import '../../widgets/widgets/buttons.dart';
import '../../widgets/widgets/errors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DevotionController devotionController = DevotionController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Today",
              style: largeHeadingStyle.copyWith(
                  fontSize: 28.0, fontWeight: FontWeight.w600))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FutureBuilder<Devotion?>(
              future: devotionController.getTodayDevotion(),
              builder: (context, devotion) {
                if (devotion.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        formatDateString(devotion.data!.messageDate),
                        style: mediumTextStyle.copyWith(fontSize: 16.0),
                      ),
                      const HomePageHeaderImage(),
                      const SizedBox(height: 12.0),
                      CustomSectionHeadingContainer(
                          title: "Today's Devotional"),
                      const SizedBox(height: 18.0),
                      TodayDevotionTopic(topic: devotion.data!.devotionTitle),
                      const SizedBox(height: 10.0),
                      CustomBibleVerse(bibleVerse: devotion.data!.bibleVerse),
                      const SizedBox(height: 2.5),
                      BibleVerse(
                        bibleVerse: devotion.data!.bibleVerseMessage,
                        maxLines: 4,
                      ),
                      const SizedBox(height: 26.0),
                      ReadDevotionButton(
                        devotion: devotion.data!,
                      )
                    ],
                  );
                } else if (devotion.hasError) {
                  return const NoDevotionFound();
                } else if (devotion.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return const NoDevotionFound();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/models/devotion.dart';
import 'package:meet_god_daily_client/utils/date_fomatter.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/containers.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/texts.dart';

import '../../widgets/styles/text_styles.dart';

class ReadDevotion extends StatelessWidget {
  final Devotion devotion;
  const ReadDevotion({super.key, required this.devotion});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Devotion',
          style: largeHeadingStyle.copyWith(
              fontSize: 28.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSectionHeadingContainer(
                  title: formatDateString(devotion.messageDate),
                  fontSize: 13.0),
              const SizedBox(height: 8.0),
              TodayDevotionTopic(
                topic: devotion.devotionTitle,
              ),
              const SizedBox(height: 5.0),
              Text("By ${devotion.devotionWriter}",
                  style: fontFamilyOnly.copyWith(color: Colors.grey)),
              const SizedBox(height: 18.0),
              CustomBibleVerse(bibleVerse: devotion.bibleVerse),
              CustomSectionBody(message: devotion.bibleVerseMessage),
              CustomSectionHeadingContainer(title: "Read", fontSize: 13.0),
              CustomSectionBody(message: devotion.devotionMessage),
              CustomSectionHeadingContainer(title: "Prayer", fontSize: 13.0),
              CustomSectionBody(message: devotion.devotionPrayer),
            ],
          ),
        ),
      ),
    );
  }
}

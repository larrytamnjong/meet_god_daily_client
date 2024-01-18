import 'package:flutter/material.dart';

import '../styles/text_styles.dart';

class CustomSectionBody extends StatelessWidget {
  final String message;
  const CustomSectionBody({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '''
    $message
    ''',
      style: mediumTextStyle,
    );
  }
}

class CustomBibleVerse extends StatelessWidget {
  final String bibleVerse;
  const CustomBibleVerse({super.key, required this.bibleVerse});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2.5),
      child: Text(
        bibleVerse,
        style: mediumTextStyle.copyWith(color: Colors.green, fontSize: 16.0),
      ),
    );
  }
}

class TodayDevotionTopic extends StatelessWidget {
  final String topic;
  const TodayDevotionTopic({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Text(
      topic,
      style:
          largeHeadingStyle.copyWith(fontWeight: FontWeight.w600, fontSize: 22),
    );
  }
}

class BibleVerse extends StatelessWidget {
  final String bibleVerse;
  final int maxLines;
  const BibleVerse({
    super.key,
    required this.bibleVerse,
    required this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      bibleVerse,
      style: fontFamilyOnly,
      maxLines: maxLines,
      overflow: TextOverflow.fade,
    );
  }
}

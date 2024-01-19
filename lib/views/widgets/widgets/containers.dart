import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_paths.dart';
import '../../../models/devotion.dart';
import '../../../utils/date_fomatter.dart';
import '../../pages/dashboard/read_devotion.dart';
import '../styles/text_styles.dart';

class CustomSectionHeadingContainer extends StatelessWidget {
  final String title;
  final double? fontSize;
  const CustomSectionHeadingContainer(
      {super.key, required this.title, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Colors.lightGreen.withOpacity(0.2),
        ),
        height: 40.0,
        width: MediaQuery.sizeOf(context).width / 1.8,
        child: Center(
          child: Text(
            title,
            style: mediumTextStyle.copyWith(
                fontSize: fontSize ?? 16, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class HomePageHeaderImage extends StatelessWidget {
  const HomePageHeaderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      shape: const RoundedRectangleBorder(
        side: BorderSide(width: 0.0),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Image(
        image: AssetImage(ImagePaths.churchImage),
      ),
    );
  }
}

class DevotionCard extends StatelessWidget {
  final Devotion devotion;
  const DevotionCard({
    super.key,
    required this.devotion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.calendar_month),
        title: Text(
          formatDateString(devotion.messageDate),
        ),
        subtitle: Text(devotion.devotionTitle),
        onTap: () {
          Get.to(
            () => ReadDevotion(devotion: devotion),
          );
        },
      ),
    );
  }
}

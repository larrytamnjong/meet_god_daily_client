import 'package:flutter/material.dart';

import '../../../constants/image_paths.dart';
import '../styles/text_styles.dart';

class CustomSectionHeadingContainer extends StatelessWidget {
  final String title;
  double? fontSize = 16;
  CustomSectionHeadingContainer(
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
        width: MediaQuery.sizeOf(context).width / 2,
        child: Center(
          child: Text(
            title,
            style: mediumTextStyle.copyWith(
                fontSize: fontSize, fontWeight: FontWeight.w400),
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

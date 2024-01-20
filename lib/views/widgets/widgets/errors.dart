import 'package:flutter/material.dart';

import '../../../constants/image_paths.dart';
import '../styles/text_styles.dart';

class NoDevotionFound extends StatelessWidget {
  const NoDevotionFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Image(
                image: AssetImage(ImagePaths.pageNotFound),
              ),
            ),
            Text(
              "We could not retrieve any devotions for today please verify your internet connection or your free trial has ended please subscribe.",
              style: fontFamilyOnly,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class InternalError extends StatelessWidget {
  const InternalError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Image(
                image: AssetImage(ImagePaths.bugFixing),
              ),
            ),
            Text(
              "We encountered an error or could not find anything.",
              style: fontFamilyOnly,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

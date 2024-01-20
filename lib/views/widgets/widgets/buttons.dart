import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/devotion.dart';
import '../../pages/dashboard/read_devotion.dart';
import '../styles/text_styles.dart';

class ReadDevotionButton extends StatelessWidget {
  final Devotion devotion;
  const ReadDevotionButton({
    super.key,
    required this.devotion,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 47.0,
      width: MediaQuery.sizeOf(context).width / 2,
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),
        onPressed: () {
          Get.to(() => ReadDevotion(devotion: devotion));
        },
        child: Text(
          "Read",
          style: mediumTextStyle.copyWith(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

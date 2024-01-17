import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/constants/image_paths.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/read_devotion.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Today",
          style: largeHeadingStyle.copyWith(
              fontSize: 28.0, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "  Wednesday January, 2024",
                  style: mediumTextStyle.copyWith(fontSize: 16.0),
                ),
                Card(
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
                ),
                const SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Colors.lightGreen.withOpacity(0.2),
                  ),
                  height: 40.0,
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: Center(
                    child: Text(
                      "Today's Devotional",
                      style: mediumTextStyle.copyWith(
                          fontSize: 16.0, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 18.0),
                Text(
                  "Choosing to Follow God no matter what.",
                  style: largeHeadingStyle.copyWith(
                      fontWeight: FontWeight.w600, fontSize: 22),
                ),
                const SizedBox(height: 10.0),
                Text(
                  "Deuteronomy 12 vs 6- 7",
                  style: mediumTextStyle.copyWith(
                      color: Colors.green, fontSize: 16.0),
                ),
                const SizedBox(height: 2.5),
                Text(
                  "Nullam enim vestibulum nibh potenti cum non massa fusce accumsan,"
                  "bibendum morbi convallis suscipit platea mi aliquam quisque "
                  "purus viverra, aenean faucibus odio metus elementum a phasellus ridiculus.",
                  style: fontFamilyOnly,
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                ),
                const SizedBox(height: 26.0),
                SizedBox(
                  height: 50.0,
                  width: MediaQuery.sizeOf(context).width / 2,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: () {
                      Get.to(() => const ReadDevotion());
                    },
                    child: Text(
                      "Read",
                      style: mediumTextStyle.copyWith(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

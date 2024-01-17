import 'package:flutter/material.dart';

import '../../widgets/styles/text_styles.dart';

class ReadDevotion extends StatefulWidget {
  const ReadDevotion({super.key});

  @override
  State<ReadDevotion> createState() => _ReadDevotionState();
}

class _ReadDevotionState extends State<ReadDevotion> {
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
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightGreen.withOpacity(0.2),
                ),
                height: 40.0,
                width: MediaQuery.sizeOf(context).width / 2,
                child: Center(
                  child: Text(
                    "Wednesday January, 2024",
                    style: mediumTextStyle.copyWith(
                        fontSize: 12.0, fontWeight: FontWeight.w400),
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
              const SizedBox(height: 5.0),
              Text(
                "By Tamnjong Larry Tabeh",
                style: fontFamilyOnly,
              ),
              const SizedBox(height: 18.0),
              Text(
                "Deuteronomy 12 vs 6- 7",
                style: mediumTextStyle.copyWith(
                    color: Colors.green, fontSize: 16.0),
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightGreen.withOpacity(0.2),
                ),
                height: 40.0,
                width: MediaQuery.sizeOf(context).width / 2,
                child: Center(
                  child: Text(
                    "Read",
                    style: mediumTextStyle.copyWith(
                        fontSize: 12.0, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '''
Faucibus arcu quam porttitor ligula ridiculus sed interdum fusce metus tristique facilisis dis, egestas tempus fames cubilia feugiat auctor sodales luctus morbi justo eros. Consequat pellentesque vestibulum felis faucibus dis primis at porttitor, iaculis per volutpat non vel sollicitudin tincidunt varius conubia, class pharetra cubilia fermentum mauris natoque sed. Phasellus donec taciti at penatibus felis placerat est lectus ad ante, sagittis magna rhoncus malesuada aptent nullam laoreet torquent nam. Nascetur metus penatibus rhoncus tristique leo risus magna platea, euismod curae lacinia mattis duis egestas interdum est, ridiculus sem turpis varius dictum imperdiet pretium. A venenatis eu habitasse fringilla mauris class quam dictum, aenean odio sed eget est in.
                ''',
                style: mediumTextStyle,
              ),
              const SizedBox(height: 10.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.lightGreen.withOpacity(0.2),
                ),
                height: 40.0,
                width: MediaQuery.sizeOf(context).width / 2,
                child: Center(
                  child: Text(
                    "Prayer",
                    style: mediumTextStyle.copyWith(
                        fontSize: 12.0, fontWeight: FontWeight.w400),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Text(
                '''
Faucibus arcu quam porttitor ligula ridiculus sed interdum fusce metus tristique facilisis dis, egestas tempus fames cubilia feugiat auctor sodales luctus morbi justo eros. Consequat pellentesque vestibulum felis faucibus dis primis at porttitor, iaculis per volutpat non vel sollicitudin tincidunt varius conubia, class pharetra cubilia fermentum mauris natoque sed. Phasellus donec taciti at penatibus felis placerat est lectus ad ante, sagittis magna rhoncus malesuada aptent nullam laoreet torquent nam. Nascetur metus penatibus rhoncus tristique leo risus magna platea, euismod curae lacinia mattis duis egestas interdum est, ridiculus sem turpis varius dictum imperdiet pretium. A venenatis eu habitasse fringilla mauris class quam dictum, aenean odio sed eget est in.
                ''',
                style: mediumTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: "Privacy policy",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Text(
            '''
            Lorem ipsum dolor sit amet consectetur adipiscing elit elementum, tristique varius himenaeos dictumst velit arcu dignissim, non in consequat dictum mollis aliquet class. Nullam litora montes ligula facilisi primis fames nam curabitur tristique, est torquent aliquam urna etiam magna turpis. Erat aenean pretium lacinia est litora imperdiet netus, molestie et vel ut nec platea nascetur, praesent gravida parturient etiam libero mollis. Duis iaculis vel imperdiet turpis risus fringilla pharetra orci, tempus velit volutpat cum porttitor litora commodo suspendisse, sociosqu scelerisque euismod sem torquent in aliquet. Nulla velit condimentum integer dis odio curae mi venenatis felis, suscipit potenti feugiat cursus ornare viverra quis ac metus rutrum, diam ante phasellus tortor pretium augue urna primis. Massa imperdiet morbi urna aptent ornare senectus nostra gravida, aliquam nisl sem sollicitudin orci eros ultricies ullamcorper quisque, dui faucibus fringilla suspendisse lacus donec mollis conubia, auctor tortor dapibus arcu duis curae erat. Suscipit nostra condimentum dapibus potenti mi posuere, odio quam est eleifend aenean tempus, sollicitudin tristique ad auctor magnis.

Condimentum senectus at ullamcorper lectus mus nisl porta posuere hendrerit, suspendisse aliquam lobortis id mollis arcu luctus torquent ut, conubia justo tristique ac metus sem sed ultrices. Nec urna himenaeos nunc dictumst nostra facilisis condimentum interdum, natoque congue euismod ornare per faucibus odio porttitor rutrum, nibh leo eros venenatis volutpat laoreet sagittis. Volutpat leo gravida quis sociis parturient interdum lectus tellus massa metus mattis quisque at, fames curae consequat ac vulputate lacinia class proin sollicitudin ante tempor. Cum natoque libero conubia gravida ornare eros erat aliquet, sociis suspendisse vitae sodales habitasse neque. Lectus et egestas vehicula fusce malesuada pharetra commodo, bibendum lacus natoque curabitur orci facilisi maecenas hac, augue convallis sagittis ornare quis fermentum. Rhoncus non donec molestie etiam cum nunc porttitor, blandit aliquet in vehicula congue. Cursus enim cubilia platea luctus himenaeos scelerisque venenatis urna mi, odio aenean praesent ullamcorper magnis purus porttitor curabitur ligula egestas, laoreet cum risus est taciti pharetra hac eget. Nisi tortor primis mattis sociosqu dis faucibus augue congue lacinia, magnis integer magna est sociis ut dictumst arcu, purus mus natoque velit tempor libero sodales venenatis.
            ''',
            style: mediumTextStyle.copyWith(fontSize: 15.0),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}

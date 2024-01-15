import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/constants/image_paths.dart';
import 'package:meet_god_daily_client/constants/texts.dart';
import 'package:meet_god_daily_client/views/pages/authentication/login_screen.dart';
import 'package:meet_god_daily_client/views/pages/authentication/registration_screen.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage(ImagePaths.churchImage),
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.white],
                stops: [0, .4],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 300, bottom: 8.0, left: 8.0, right: 8.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(ConstantText.onboardingTile,
                        style: largeHeadingStyle, textAlign: TextAlign.center),
                    const SizedBox(height: 10.0),
                    Text(ConstantText.onboardingMessage,
                        style: mediumTextStyle, textAlign: TextAlign.center),
                    const SizedBox(height: 60.0),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 12.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                Get.to(const RegistrationScreen());
                              },
                              child: const Text("Get started")),
                          TextButton(
                            onPressed: () {
                              Get.to(const LoginScreen());
                            },
                            child:
                                const Text("Already have an account? login."),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

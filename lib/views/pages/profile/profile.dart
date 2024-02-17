import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/controllers/authentication/authentication.dart';
import 'package:meet_god_daily_client/views/pages/authentication/onboarding_screen.dart';
import 'package:meet_god_daily_client/views/pages/profile/privacy_policy.dart';
import 'package:meet_god_daily_client/views/widgets/styles/text_styles.dart';
import 'package:meet_god_daily_client/views/widgets/widgets/containers.dart';

import '../../../models/user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late AuthenticationController authenticationController =
      AuthenticationController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          title: "Profile",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: FutureBuilder<User?>(
              future: authenticationController.loadLoggedInUser(),
              builder: (context, user) {
                if (user.data == null) {
                  return const Center();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const CircleAvatar(
                      radius: 55.0,
                      child: Icon(
                        Icons.person,
                        size: 55.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomSectionHeadingContainer(
                      title: user.data!.fullName!,
                    ),
                    CustomSectionHeadingContainer(title: user.data!.email!),
                    CustomSectionHeadingContainer(title: user.data!.phone!),
                    CustomSectionHeadingContainer(
                        title: user.data!.creationDate!),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () async {
                        await authenticationController.logOutUser();
                        Get.off(() => const OnboardingScreen());
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.redAccent)),
                      child: Text(
                        "Logout",
                        style: mediumTextStyle.copyWith(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const PrivacyPolicy());
                      },
                      child: const Text("Read privacy policy"),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Please contact us at P.O. Box 1, Bamenda NWR, Cameroon",
                      style: mediumTextStyle.copyWith(
                          color: Colors.grey, fontSize: 12),
                      textAlign: TextAlign.center,
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }
}

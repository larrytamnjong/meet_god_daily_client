import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meet_god_daily_client/utils/shared_preference.dart';
import 'package:meet_god_daily_client/views/pages/authentication/onboarding_screen.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return FlutterSplashScreen.scale(
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.lightGreen,
          Colors.white,
        ],
      ),
      childWidget: const SizedBox(
        height: 50,
        child: Icon(
          Icons.church,
          size: 80.0,
          color: Colors.green,
        ),
      ),
      animationDuration: const Duration(seconds: 2000),
      asyncNavigationCallback: () async {
        var userId = await SharedPreference.getUserId();
        if (userId != null) {
          Get.off(() => const DashboardScreen());
        } else {
          Get.off(() => const OnboardingScreen());
        }
      },
    );
  }
}

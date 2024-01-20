import 'package:flutter/material.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/devotions.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/home.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/profile.dart';
import 'package:meet_god_daily_client/views/pages/dashboard/subscription.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 68,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home_outlined, size: 27),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.church, size: 27),
            label: 'Devotions',
          ),
          NavigationDestination(
            icon: Icon(Icons.subscriptions, size: 27),
            label: 'Subscriptions',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_2_rounded, size: 27),
            label: 'Profile',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const PastDevotionsScreen(),
        const SubscriptionScreen(),
        const ProfilePage()
      ][currentPageIndex],
    );
  }
}

import 'package:flutter/material.dart';
import '../widgets/custom_bottom_nav.dart';
import 'page07_home_screen.dart';
import 'page08_scan_plant_screen.dart';
import 'page13_plant_guides_screen.dart';
import 'page15_profile_screen.dart';

/// Main Navigation Container managing the Bottom Navigation Bar
class MainNavigationWrapper extends StatefulWidget {
  final int initialIndex;

  const MainNavigationWrapper({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      Page07HomeScreen(onNavigateTab: _onTabTapped),
      const Page08ScanPlantScreen(isTabScreen: true),
      const Page13PlantGuidesScreen(isTabScreen: true),
      const Page15ProfileScreen(isTabScreen: true),
    ];

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
      ),
    );
  }
}

import 'dart:async';
import 'package:flutter/material.dart';
import '../resources/images.dart';
import '../resources/text.dart';
import 'page02_create_account_screen.dart';

/// Page 1: Splash Screen
class Page01SplashScreen extends StatefulWidget {
  const Page01SplashScreen({super.key});

  @override
  State<Page01SplashScreen> createState() => _Page01SplashScreenState();
}

class _Page01SplashScreenState extends State<Page01SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Auto-navigate after 2.5 seconds to Create Account screen
    _timer = Timer(const Duration(milliseconds: 2500), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Page02CreateAccountScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _skipToNext() {
    _timer?.cancel();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Page02CreateAccountScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _skipToNext,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF388E3C), Color(0xFF1B5E20)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // Decorative floating leaves in the background
                Positioned(
                  top: 60,
                  left: 40,
                  child: Icon(
                    Icons.energy_savings_leaf_outlined,
                    size: 36,
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                Positioned(
                  top: 180,
                  right: 50,
                  child: Icon(
                    Icons.spa_outlined,
                    size: 32,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  bottom: 180,
                  right: 60,
                  child: Icon(
                    Icons.eco_outlined,
                    size: 40,
                    color: Colors.white.withValues(alpha: 0.25),
                  ),
                ),
                Positioned(
                  bottom: 120,
                  left: 50,
                  child: Icon(
                    Icons.local_florist_outlined,
                    size: 28,
                    color: Colors.white.withValues(alpha: 0.2),
                  ),
                ),

                // Main Center Logo and App Name
                Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Circular Logo Badge using master asset image
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.3),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              appLogoImg,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(
                                Icons.eco,
                                size: 54,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Title from text.dart
                      const Text(
                        appName,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Subtitle from text.dart
                      Text(
                        appSubtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.85),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // Bottom loading dots indicator
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.5),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

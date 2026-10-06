import 'package:flutter/material.dart';

/// Central color definitions matching the Plant Doctor AI design
class AppColors {
  // Main Theme Colors
  static const Color primary = Color(0xFF2E7D32); // Main Green
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color primaryLight = Color(0xFF4CAF50);
  static const Color primaryMint = Color(0xFFE8F5E9);
  static const Color primarySoft = Color(0xFFD0F0D8);

  // Background Colors
  static const Color background = Color(0xFFF8FBF8); // Clean light background
  static const Color darkBackground = Color(0xFF0F2B1D); // Dark green for Analyzing screen
  static const Color cardWhite = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF1A2E20);
  static const Color textSecondary = Color(0xFF637D6B);
  static const Color textMuted = Color(0xFF9CB2A2);

  // Status Colors
  static const Color healthyGreen = Color(0xFF2E7D32);
  static const Color healthyBg = Color(0xFFE8F5E9);

  static const Color warningOrange = Color(0xFFF57C00);
  static const Color warningBg = Color(0xFFFFF3E0);

  static const Color diseaseRed = Color(0xFFD32F2F);
  static const Color diseaseBg = Color(0xFFFFEBEE);

  // UI Borders and Shadows
  static const Color border = Color(0xFFE1EBE2);
  static const Color borderLight = Color(0xFFEEF5EF);

  // Gradients
  static const LinearGradient greenGradient = LinearGradient(
    colors: [Color(0xFF2E7D32), Color(0xFF43A047)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient heroCardGradient = LinearGradient(
    colors: [Color(0xFF256B2B), Color(0xFF388E3C), Color(0xFF43A047)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkGreenGradient = LinearGradient(
    colors: [Color(0xFF0D2818), Color(0xFF143F24)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

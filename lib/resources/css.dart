import 'package:flutter/material.dart';

/// Master CSS-like styling classes, colors, gradients and text styles for Plant Doctor AI
class AppCss {
  // CSS Colors
  static const Color primary = Color(0xFF2E7D32); // Primary Nature Green
  static const Color primaryDark = Color(0xFF1B5E20);
  static const Color primaryLight = Color(0xFF4CAF50);
  static const Color primaryMint = Color(0xFFE8F5E9);
  static const Color primarySoft = Color(0xFFD0F0D8);

  static const Color background = Color(0xFFF8FBF8); // Clean light background
  static const Color darkBackground = Color(0xFF0F2B1D); // Dark emerald for Analyzing
  static const Color cardWhite = Colors.white;

  static const Color textPrimary = Color(0xFF1A2E20);
  static const Color textSecondary = Color(0xFF637D6B);
  static const Color textMuted = Color(0xFF9CB2A2);

  // Status & Alert Colors
  static const Color healthyGreen = Color(0xFF2E7D32);
  static const Color healthyBg = Color(0xFFE8F5E9);
  static const Color warningOrange = Color(0xFFF57C00);
  static const Color warningBg = Color(0xFFFFF3E0);
  static const Color diseaseRed = Color(0xFFD32F2F);
  static const Color diseaseBg = Color(0xFFFFEBEE);

  static const Color border = Color(0xFFE1EBE2);
  static const Color borderLight = Color(0xFFEEF5EF);

  // CSS Gradients
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

  // CSS Typography Styles
  static const TextStyle heading1 = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.bold,
    color: textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: textPrimary,
  );

  static const TextStyle heading3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: textPrimary,
  );

  static const TextStyle bodyText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: textSecondary,
    height: 1.4,
  );

  static const TextStyle subtitleText = TextStyle(
    fontSize: 13,
    color: textSecondary,
  );

  static const TextStyle labelText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textSecondary,
  );

  // CSS Border Radiuses
  static final BorderRadius radiusSmall = BorderRadius.circular(12);
  static final BorderRadius radiusMedium = BorderRadius.circular(18);
  static final BorderRadius radiusLarge = BorderRadius.circular(24);
  static final BorderRadius radiusPill = BorderRadius.circular(50);

  // CSS Box Shadows
  static final List<BoxShadow> softShadow = [
    BoxShadow(
      color: Colors.black.withValues(alpha: 0.03),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  static final List<BoxShadow> primaryShadow = [
    BoxShadow(
      color: primary.withValues(alpha: 0.25),
      blurRadius: 12,
      offset: const Offset(0, 4),
    ),
  ];
}

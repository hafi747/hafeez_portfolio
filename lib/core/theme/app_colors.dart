import 'package:flutter/material.dart';

/// Brand + semantic colors used across both light and dark themes.
/// Keep this as the single source of truth for color values.
class AppColors {
  AppColors._();

  // Brand seed color used to generate the Material 3 ColorScheme.
  static const Color seed = Color(0xFF2F6FED); // confident blue
  static const Color accent = Color(0xFF16C79A); // teal-green accent

  // Dark theme surfaces
  static const Color darkBackground = Color(0xFF0B1120);
  static const Color darkSurface = Color(0xFF121A2C);
  static const Color darkSurfaceAlt = Color(0xFF1B2540);

  // Light theme surfaces
  static const Color lightBackground = Color(0xFFF6F8FC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceAlt = Color(0xFFEEF2FA);

  // Status
  static const Color success = Color(0xFF2ECC71);
  static const Color warning = Color(0xFFF5A623);
  static const Color error = Color(0xFFE74C3C);
}

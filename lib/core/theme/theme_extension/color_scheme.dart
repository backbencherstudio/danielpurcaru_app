import 'package:flutter/material.dart';

class AppColorScheme {
  static const Color primary = Color(0xFF82C8E5);
  static const Color onPrimary = Color(0xFF1D1F2C);
  static const Color secondary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xFF777980);
  static const Color error = Color(0xFFD7CCC8);
  static const Color onError = Color(0xFFEB3D4D);
  static const Color surface = Color(0xFFF7F8F9);
  static const Color onSurface = Color(0xFFA5A5AB);
  static const Color successful = Color(0xFF1A9882);

  static ColorScheme colorScheme = ColorScheme.light(
    primary: primary,
    secondary: secondary,
    surface: surface,
    onPrimary: onPrimary,
    onSecondary: onSecondary,
    onSurface: onSurface,
    error: error,
    onError: onError,
    brightness: Brightness.light,
    errorContainer: error,
  );
}

import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextTheme {
  static final TextTheme lightTextTheme = TextTheme(
    ///display
    displayLarge: GoogleFonts.urbanist(
      fontSize: 32.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    displayMedium: GoogleFonts.urbanist(
      fontSize: 28.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    displaySmall: GoogleFonts.urbanist(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),

    ///title
    titleLarge: GoogleFonts.urbanist(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    titleMedium: GoogleFonts.urbanist(
      fontSize: 22.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),
    titleSmall: GoogleFonts.urbanist(
      fontSize: 20.0.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.onPrimary,
    ),

    ///body
    bodyLarge: GoogleFonts.urbanist(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),
    bodyMedium: GoogleFonts.urbanist(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),
    bodySmall: GoogleFonts.urbanist(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.normal,
      color: AppColorScheme.onPrimary,
    ),

    ///label
    labelLarge: GoogleFonts.urbanist(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.onSecondary,
    ),
    labelMedium: GoogleFonts.urbanist(
      fontSize: 12.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.onSecondary,
    ),
    labelSmall: GoogleFonts.urbanist(
      fontSize: 10.0.sp,
      fontWeight: FontWeight.w400,
      color: AppColorScheme.onSecondary,
    ),
  );
}

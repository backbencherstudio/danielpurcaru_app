import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class AppInputDecorationTheme {
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 18.h),
    filled: true,
    fillColor: Color(0xffF7F8F9),
    hintStyle: GoogleFonts.urbanist(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: Color(0xffA5A5AB),
    ),
    labelStyle: GoogleFonts.urbanist(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: AppColorScheme.textColor,
    ),
    prefixIconColor: Color(0xff6A707C),
    suffixIconColor: Color(0xff6A707C),
    errorStyle: GoogleFonts.urbanist(
      fontSize: 14.sp,
      fontWeight: FontWeight.w400,
      color: Color(0xffFC5733),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Color(0xffE8ECF4)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Color(0xffE8ECF4)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: AppColorScheme.primary.withValues(alpha: 0.5)),
    ),
    disabledBorder: InputBorder.none,
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.r),
      borderSide: BorderSide(color: Color(0xffE8ECF4)),
    ),
  );
}

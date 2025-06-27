import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'language_manu_bar/language_manu_bar.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isBackButton;
  final bool isTrailing;
  final bool centerTitle;
  const CustomAppBar({
    super.key,
    required this.title,
    this.isBackButton = false,
    this.isTrailing = true,
    this.centerTitle = false,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16.r),
        bottomRight: Radius.circular(16.r),
      ),
      child: AppBar(
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColorScheme.primary,
        centerTitle: centerTitle,
        title: Padding(
          padding:  EdgeInsets.only( left : 8.w),
          child: Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(color: Colors.white),
          ),
        ),
        leading: isBackButton
            ? IconButton(
                onPressed: () => context.pop(),
                icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.white),
              )
            : null,
        actions: [
          if (isTrailing)
            LanguageManuBar(),
        ],
      ),
    );
  }
}

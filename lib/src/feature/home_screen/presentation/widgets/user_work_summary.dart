import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';

class UserWorkSummary extends StatelessWidget {
  const UserWorkSummary({super.key});

  Widget _summaryContainer({
    required String title,
    required String body,
    required TextTheme textTheme,
  }) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(12.r),
        width: 160.w,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          spacing: 8.h,
          children: [
            Text(
              title,
              style: textTheme.bodyLarge?.copyWith(
                color: AppColorScheme.secondaryTextColor,
              ),
            ),
            Text(body, style: textTheme.titleMedium),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: AppPadding.horizontalPadding,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16.r),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Column(
              spacing: 4.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Jerome Bell",
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Hondyman",
                  style: textTheme.bodySmall?.copyWith(
                    color: AppColorScheme.labelTextColor,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 16.h),
          Row(
            spacing: 12.w,
            children: [
              _summaryContainer(
                title: "Total Hours",
                textTheme: textTheme,
                body: "150",
              ),
              _summaryContainer(
                title: "Per Hours",
                textTheme: textTheme,
                body: "\$10",
              ),
              _summaryContainer(
                title: "Earning",
                textTheme: textTheme,
                body: "\$1500",
              ),
            ],
          ),
        ],
      ),
    );
  }
}

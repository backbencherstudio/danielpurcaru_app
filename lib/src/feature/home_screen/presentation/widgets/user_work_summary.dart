import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/constant/padding.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';
import '../../data/provider/employee_summery_provider.dart';

class UserWorkSummary extends StatelessWidget {
  final bool isHeading;
  final bool rateShow;

  const UserWorkSummary({
    super.key,
    this.isHeading = true,
    this.rateShow = true,
  });

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
            Text(
              body,
              style: textTheme.titleMedium,
            ),
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
      child: Consumer(
        builder: (context, ref, _) {

          final employeeSummary = ref.watch(employeeSummaryNotifierProvider);

          return Column(
            children: [
              if (isHeading)
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
                        employeeSummary.employeeName,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        employeeSummary.role,
                        style: textTheme.bodySmall?.copyWith(
                          color: AppColorScheme.labelTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              if (isHeading) SizedBox(height: 16.h),
              Row(
                spacing: 12.w,
                children: [
                  _summaryContainer(
                    title: "Total Hours",
                    textTheme: textTheme,
                    body: employeeSummary.totalHours.toString(),
                  ),
                  if (rateShow)
                    _summaryContainer(
                      title: "Per Hour",
                      textTheme: textTheme,
                      body: "\$${employeeSummary.parHours.toStringAsFixed(2)}",
                    ),
                  _summaryContainer(
                    title: rateShow ? "Earning" : "Total Earning",
                    textTheme: textTheme,
                    body: "\$${employeeSummary.earning.toStringAsFixed(2)}",
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

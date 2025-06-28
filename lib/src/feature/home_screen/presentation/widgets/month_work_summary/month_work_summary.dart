import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MonthWorkSummary extends StatelessWidget {
  const MonthWorkSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
      height: 230.h,
      margin: AppPadding.horizontalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20.h,
        children: [
          Text(
            "Month",
            style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  spacing: 12.h,

                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Status",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColorScheme.labelTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "%",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColorScheme.labelTextColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColorScheme.labelTextColor),
                    Row(
                      spacing: 12.w,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xff1A9882),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          "Complete",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColorScheme.secondaryTextColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "70%",
                          style: textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 12.w,
                      children: [
                        Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: Color(0xffEB3D4D),
                            shape: BoxShape.circle,
                          ),
                        ),
                        Text(
                          "Unfinished",
                          style: textTheme.bodyMedium?.copyWith(
                            color: AppColorScheme.secondaryTextColor,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "30%",
                          style: textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20.w),
              SizedBox(
                width: 135.w,
                height: 137.h,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: 65.h,
                        height: 65.h,
                        padding: EdgeInsets.symmetric(vertical: 9.h),
                        decoration: BoxDecoration(
                          color: AppColorScheme.textColor,
                          shape: BoxShape.circle,
                        ),
                        child: Column(
                          spacing: 2.h,
                          children: [
                            Text(
                              "22",
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Day",
                              style: textTheme.labelLarge?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.center,

                      child: CircularProgressIndicator(
                        strokeWidth: 20,
                        year2023: true,
                        value: 0.7,
                        color: Color(0xff1A9882),
                        backgroundColor: Color(0xffEB3D4D),
                        constraints: BoxConstraints(
                          minHeight: 137.w,
                          maxHeight: 137.w,
                          minWidth: 135.w,
                          maxWidth: 135.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

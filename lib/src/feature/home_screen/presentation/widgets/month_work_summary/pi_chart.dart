import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/theme/theme_extension/color_scheme.dart';

class PiChart extends StatelessWidget{
  const PiChart({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: 140.h,
      height: 140.h,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 75.h,
              height: 75.h,
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
              strokeWidth: 22,
              value: 0.7,
              color: Color(0xff1A9882),
              backgroundColor: Color(0xffEB3D4D),
              constraints: BoxConstraints(
                minHeight: 137.h,
                maxHeight: 137.h,
                minWidth: 137.h,
                maxWidth: 137.h,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
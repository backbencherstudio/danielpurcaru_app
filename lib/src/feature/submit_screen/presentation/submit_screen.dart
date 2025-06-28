import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_list_calendar/horizontal_list_calendar.dart';

import '../../../../core/constant/padding.dart';
import '../../../../core/theme/theme_extension/color_scheme.dart';
import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../calendar/calendar.dart';

class SubmitScreen extends StatefulWidget {
  const SubmitScreen({super.key});

  @override
  State<SubmitScreen> createState() => _SubmitScreenState();
}

class _SubmitScreenState extends State<SubmitScreen> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(title: "Company Name"),

            SizedBox(height: 24.h),

            Calendar(),
            // Padding(
            //   padding: AppPadding.horizontalPadding,
            //   child: Container(
            //     padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(8.r),
            //       color: Colors.white,
            //     ),
            //     child: HorizontalListCalendar(
            //       scrollController: scrollController,
            //       canSelectDate: false,
            //       monthChangeButton: false,
            //       moveToNextMonthIconBackgroundColor: AppColorScheme.primary,
            //       moveToPreviousMonthIconBackgroundColor:
            //           AppColorScheme.primary,
            //       unSelectedTextStyle: textTheme.bodyLarge!,
            //       selectedTextStyle: textTheme.bodyLarge!.copyWith(
            //         color: AppColorScheme.primary,
            //       ),
            //       selectedColor: AppColorScheme.primary,
            //       todayTextStyle: textTheme.bodyLarge!.copyWith(
            //         color: AppColorScheme.primary,
            //         fontWeight: FontWeight.w600,
            //       ),
            //       todayFillColor: Colors.transparent,
            //       headerTextStyle: textTheme.bodyLarge!.copyWith(
            //         fontWeight: FontWeight.w600,
            //       ),
            //       onTap: (value) {},
            //     ),
            //   ),
            // ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

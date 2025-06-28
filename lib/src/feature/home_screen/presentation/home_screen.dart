import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/home_screen/presentation/widgets/month_work_summary/month_work_summary.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/home_screen/presentation/widgets/user_work_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_list_calendar/horizontal_list_calendar.dart';

import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../calendar/calendar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //late final ScrollController scrollController;

  @override
  void initState() {
    // scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    // scrollController.dispose();
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
            SizedBox(height: 16.h),
            UserWorkSummary(),
            SizedBox(height: 16.h),
            MonthWorkSummary(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

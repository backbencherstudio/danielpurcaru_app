import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/data/provider/month_chart_repository_provider.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/home_screen/presentation/widgets/month_work_summary/month_work_summary.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/home_screen/presentation/widgets/user_work_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:horizontal_list_calendar/horizontal_list_calendar.dart';

import '../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../calendar/calendar.dart';
import '../data/provider/employee_summery_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Call your Riverpod fetch method here
    ref.read(employeeSummaryNotifierProvider.notifier).fetchSummary();
    ref.read(monthChartProvider.notifier).fetchMonthChart(month: '7');
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomAppBar(title: "Company Name"),
            SizedBox(height: 24.h),
            const Calendar(),
            SizedBox(height: 16.h),
            const UserWorkSummary(),
            SizedBox(height: 16.h),
            const MonthWorkSummary(),
            SizedBox(height: 100.h),
          ],
        ),
      ),
    );
  }
}

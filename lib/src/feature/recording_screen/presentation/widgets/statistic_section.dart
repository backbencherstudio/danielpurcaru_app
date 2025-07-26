import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/model/day_records.dart';
import '../../../../../data/model/month_records.dart';
import '../../../../../data/provider/month_chart_repository_provider.dart';
import '../../../home_screen/data/provider/employee_summery_provider.dart';
import '../../riverpod/month_repository_provider.dart';
import 'statistics_card.dart';
class StatisticSection extends ConsumerWidget {
  const StatisticSection({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthChart = ref.watch(monthChartProvider);
    final monthRecords = ref.watch(monthRecordRepositoryProvider);
    double? totalEarning;
    double? totalHours;

    if (monthRecords.isNotEmpty) {
      totalEarning = monthRecords.first.totalEarningMonthly;
      totalHours = monthRecords.first.totalHoursMonthly;
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatisticsCard(
              title: 'Total Days',
              value: monthChart.complete.toString(),
            ),
            StatisticsCard(
              title: 'Total Hours',
              value: totalHours.toString(),
            ),
            StatisticsCard(
              title: 'Total Earning',
              value: '\$${totalEarning.toString()}',
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(height: 20.h),
      ],
    );
  }
}

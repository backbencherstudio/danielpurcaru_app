import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../data/model/month_records.dart';
import 'statistics_card.dart';
class StatisticSection extends StatelessWidget {
  const StatisticSection({
    super.key,
    required this.monthRecords,
  });

  final MonthRecords monthRecords;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            StatisticsCard(
              title: 'Total Days',
              value: monthRecords.days.toString(),
            ),
            StatisticsCard(
              title: 'Total Hours',
              value: monthRecords.totalHours.toString(),
            ),
            StatisticsCard(
              title: 'Total Earning',
              value: '\$${monthRecords.totalEarning.toString()}',
            ),
          ],
        ),
        SizedBox(height: 20.h),
        SizedBox(height: 20.h),
      ],
    );
  }
}

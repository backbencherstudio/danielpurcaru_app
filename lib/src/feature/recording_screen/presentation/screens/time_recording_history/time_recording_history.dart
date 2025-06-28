import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/data/model/month_records.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../../data/dummy_data/jan_month_data.dart';
import '../../../../../../data/model/day_records.dart';
import '../../../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class TimeRecordingHistory extends StatelessWidget {
  const TimeRecordingHistory({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // Convert JSON data to DayRecord objects
    List<DayRecord> dayRecords = (janMonthData["records"] as List<dynamic>)
        .map<DayRecord>((json) => DayRecord.fromJson(json))
        .toList();
    final MonthRecords monthRecords = MonthRecords.fromJson(
      janMonthData['summary'] as Map<String, dynamic>,
    );

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Time Recording History',
            isTrailing: false,
            isBackButton: true,
          ),

          // Wrap the DataTable in a Container for better styling
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: SingleChildScrollView(
              child: DataTable(
                columnSpacing: 40.w,
                horizontalMargin: 16.w,
                dataRowMinHeight: 10.h,
                dataRowMaxHeight: 40.h,
                border: TableBorder.all(color: Color(0xffE9E9EA), width: 1.0),
                headingRowColor: WidgetStateProperty.all<Color>(
                  AppColorScheme.primary,
                ),
                decoration: Decoration.lerp(
                  BoxDecoration(
                    border: Border.all(color: Color(0xffE9E9EA)),
                    borderRadius: BorderRadiusGeometry.circular(20.r),
                  ),
                  BoxDecoration(
                    border: Border.all(color: Color(0xffE9E9EA)),
                    borderRadius: BorderRadiusGeometry.circular(20.r),
                  ),
                  1,
                ),
                dividerThickness: 0,
                columns: <DataColumn>[
                  DataColumn(label: Text('Date', style: textTheme.bodyMedium)),
                  DataColumn(label: Text('Start', style: textTheme.bodyMedium)),
                  DataColumn(label: Text('Lunch', style: textTheme.bodyMedium)),
                  DataColumn(label: Text('End', style: textTheme.bodyMedium)),
                  DataColumn(label: Text('Total', style: textTheme.bodyMedium)),
                ],
                rows: dayRecords.map<DataRow>((record) {
                  return DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Jan ${record.date.day}')), // Date
                      DataCell(Text(Utils.formatTime(record.startTime))),
                      DataCell(
                        Text(
                          Utils.formatLunchTime(
                            record.lunchStartTime,
                            record.lunchEndTime,
                            true,
                          ),
                        ),
                      ),
                      DataCell(Text(Utils.formatTime(record.endTime))),
                      DataCell(Text(record.totalHours)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(height: 20.h),

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
          ),        ],
      ),
    );
  }
}

class StatisticsCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;

  const StatisticsCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.0),  // Adds some space between the title and value
          Text(
            value,
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

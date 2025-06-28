import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../../../data/dummy_data/jan_month_data.dart';
import '../../../../../../data/model/day_records.dart';
import '../../../../../common_widgets/custom_app_bar/custom_app_bar.dart';

class TimeRecordingHistory extends StatelessWidget {
  const TimeRecordingHistory({super.key});

  // Helper function to format DateTime into HH:mm
  String formatTime(DateTime? time) {
    if (time != null) {
      return DateFormat('H:mm').format(time); // e.g., 8:30
    }
    return 'N/A';
  }

  // Helper function to format lunch time range into HH:mm-HH:mm
  String formatLunchTime(DateTime? startTime, DateTime? endTime, bool isRange) {
    if (startTime != null && endTime != null) {
      return '${DateFormat('H').format(startTime)}-${DateFormat('H').format(endTime)}';
    }
    return 'N/A';
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // Convert JSON data to DayRecord objects
    List<DayRecord> dayRecords = (janMonthData["records"] as List<dynamic>)
        .map<DayRecord>((json) => DayRecord.fromJson(json))
        .toList();

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
                      DataCell(Text(formatTime(record.startTime))),
                      DataCell(
                        Text(
                          formatLunchTime(
                            record.lunchStartTime,
                            record.lunchEndTime,
                            true,
                          ),
                        ),
                      ),
                      DataCell(Text(formatTime(record.endTime))),
                      DataCell(Text(record.totalHours)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


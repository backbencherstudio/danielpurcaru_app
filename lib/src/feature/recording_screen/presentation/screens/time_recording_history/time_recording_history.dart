import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/data/model/month_records.dart';
import 'package:danielpurcaru_time_tracker_app/data/model/day_records.dart';
import 'package:intl/intl.dart';
import '../../../../../../data/dummy_data/jan_month_data.dart';
import '../../../../../../core/utils/utils.dart';
import '../../../../../common_widgets/custom_app_bar/custom_app_bar.dart';
import '../../../riverpod/month_repository_provider.dart';
import '../../widgets/statistic_section.dart';
import 'show_earning_dialog.dart';

class TimeRecordingHistory extends ConsumerWidget {
  const TimeRecordingHistory({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    TextTheme textTheme = Theme.of(context).textTheme;

    // Convert JSON data to DayRecord objects
    List<DayRecord> dayRecords = ref.watch(monthRecordRepositoryProvider);

    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            title: 'Time Recording History',
            isTrailing: false,
            isBackButton: true,
          ),

          // DataTable wrapped in Container with BoxDecoration for styling
          Expanded(
            child: Container(
              padding: EdgeInsets.all(
                16.w,
              ), // Padding for the DataTable container
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 12.h),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.r),
                      child: DataTable(
                        columnSpacing: 40.w,
                        horizontalMargin: 16.w,
                        dataRowMinHeight: 10.h,
                        dataRowMaxHeight: 40.h,
                        border: TableBorder.all(
                          color: Color(0xffE9E9EA),
                          width: 1.0,
                        ),
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
                          DataColumn(
                            label: Text('Date', style: textTheme.bodyMedium!.copyWith(color: AppColorScheme.secondary)),
                          ),
                          DataColumn(
                            label: Text('Start', style: textTheme.bodyMedium!.copyWith(color: AppColorScheme.secondary)),
                          ),
                          DataColumn(
                            label: Text('Lunch', style: textTheme.bodyMedium!.copyWith(color: AppColorScheme.secondary)),
                          ),
                          DataColumn(
                            label: Text('End', style: textTheme.bodyMedium!.copyWith(color: AppColorScheme.secondary)),
                          ),
                          DataColumn(
                            label: Text('Total', style: textTheme.bodyMedium!.copyWith(color: AppColorScheme.secondary)),
                          ),
                        ],
                        rows: dayRecords.map<DataRow>((record) {
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(
                                GestureDetector(
                                  onTap: () => showEarningDialog(context, record), // Show dialog when row is tapped
                                  child: Text(
                                    DateFormat('MMM d').format(record.date),
                                    style: textTheme.bodySmall!.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ), // Date
                              DataCell(
                                GestureDetector(
                                    onTap: () => showEarningDialog(context, record), // Show dialog when row is tapped
                                    child: Text(record.startTime.toString())),
                              ),
                              DataCell(
                                GestureDetector(
                                  onTap: () => showEarningDialog(context, record), // Show dialog when row is tapped
                                  child: Text(record.lunchTime ?? '---'),
                                ),
                              ),
                              DataCell(GestureDetector(
                                  onTap: () => showEarningDialog(context, record), // Show dialog when row is tapped
                                  child: Text(record.endTime.toString()))),
                              DataCell(GestureDetector(
                                  onTap: () => showEarningDialog(context, record), // Show dialog when row is tapped
                                  child: Text(record.totalHoursDaily))),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Statistics Row
                    StatisticSection(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

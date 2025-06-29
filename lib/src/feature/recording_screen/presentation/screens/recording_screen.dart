import 'package:danielpurcaru_time_tracker_app/core/constant/padding.dart';
import 'package:danielpurcaru_time_tracker_app/core/routes/route_const.dart';
import 'package:danielpurcaru_time_tracker_app/data/month_name/moth_names.dart';
import 'package:danielpurcaru_time_tracker_app/src/common_widgets/custom_app_bar/custom_app_bar.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/recording_screen/riverpod/month_selection.dart' hide MonthName;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../calendar/calendar.dart';
import '../widgets/month_cell_widget.dart';

class RecordingScreen extends StatelessWidget {
  const RecordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: 'Company Name'),
          SizedBox(height: 24.h,),
          Calendar(),
          Expanded(
            child: Padding(
              padding: AppPadding.horizontalPadding,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 3.0,
                ),
                itemCount: 12,
                itemBuilder: (context, index) {
                  String monthName = MonthName.values[index]
                      .toString()
                      .split('.')
                      .last;
                  return Consumer(
                    builder: (context, ref, _) {
                      final selectedMonth = ref.watch(monthSelectionProvider);

                      bool isSelected = selectedMonth.toString().split('.').last == MonthName.values[index].toString().split('.').last;

                      return GestureDetector(
                        onTap: ()async {
                          await ref.read(monthSelectionProvider.notifier)
                              .selectMonth(index);
                          context.push(RouteName.timeRecordingHistory);
                        },
                        child: MonthCellWidget(
                          monthName: monthName,
                          isSelected: isSelected,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:danielpurcaru_time_tracker_app/data/model/month_chart.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/month_chart/month_chart_repository_impl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final monthChartProvider =
    StateNotifierProvider<MonthChartNotifier, MonthChartModel>((ref) {
      return MonthChartNotifier();
    });

class MonthChartNotifier extends StateNotifier<MonthChartModel> {
  MonthChartNotifier()
    : super(
        MonthChartModel(
          complete: 0,
          unfinished: 0,
          percentComplete: 0,
          percentUnfinished: 0,
          totalWorkingDays: 0,
          days: [],
        ),
      );

  final MonthChartRepositoryImpl repo = MonthChartRepositoryImpl();

  Future<void> fetchMonthChart({
    required String month,
  }) async {
    try {
      final employeeId = 'cmd9tdtmx0000wsl4i33r0v37';
      final response = await repo.fetchMonthChart(
        employeeId: employeeId,
        month: month,
      );
      debugPrint('Response: $response');
      state = MonthChartModel.fromJson(response);
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}

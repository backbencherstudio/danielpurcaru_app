import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:danielpurcaru_time_tracker_app/data/model/day_records.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/attendance/attendance_repository_impl.dart';

import '../../../../core/services/chache/shared_preferences_services.dart';
import '../../../../core/services/chache/shared_preferences_services_impl.dart';


final monthRecordRepositoryProvider =
StateNotifierProvider<MonthRecordNotifier, List<DayRecord>>((ref) {
  return MonthRecordNotifier();
});

class MonthRecordNotifier extends StateNotifier<List<DayRecord>> {
  MonthRecordNotifier() : super([]);

  Future<void> fetchMonthRecords(int month) async {
    try {
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final employeeId = sharedPrefs.fetch(key: CacheKey.employeeId);
      final response = await AttendanceRepositoryImpl().getAttendance(
        employeeId: employeeId,
        month: '$month',
      );

      final List<DayRecord> records = (response)
          .map<DayRecord>((json) => DayRecord.fromJson(json))
          .toList();

      // 🧮 Calculate monthly totals
      double totalEarning = 0.0;
      double totalHours = 0.0;

      for (var record in records) {
        totalEarning += record.earningDaily;

        // Convert totalHoursDaily string to number (e.g., "8h 30m")
        totalHours += _parseHourString(record.totalHoursDaily);
      }

      // 🏷 Apply totals to each record
      final updatedRecords = records.map((record) {
        return DayRecord(
          employeeId: record.employeeId,
          date: record.date,
          startTime: record.startTime,
          lunchTime: record.lunchTime,
          endTime: record.endTime,
          totalHoursDaily: record.totalHoursDaily,
          earningDaily: record.earningDaily,
          totalEarningMonthly: totalEarning,
          totalHoursMonthly: totalHours,
        );
      }).toList();

      state = updatedRecords;
    } catch (e) {
      throw Exception('Failed to fetch month records: $e');
    }
  }

  // Helper: Convert strings like "8h", "7.5", or "8h 30m" to double hours
  double _parseHourString(String hourString) {
    final regex = RegExp(r'([\d.]+)');
    final match = regex.firstMatch(hourString);
    if (match != null) {
      return double.tryParse(match.group(1) ?? '0') ?? 0.0;
    }
    return 0.0;
  }
}

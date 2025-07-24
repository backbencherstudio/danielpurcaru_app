import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:danielpurcaru_time_tracker_app/data/model/day_records.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/attendance/attendance_repository_impl.dart';


final monthRecordRepositoryProvider =
StateNotifierProvider<MonthRecordNotifier, List<DayRecord>>((ref) {
  return MonthRecordNotifier();
});

class MonthRecordNotifier extends StateNotifier<List<DayRecord>> {
  MonthRecordNotifier() : super([]);

  Future<void> fetchMonthRecords(int month) async {
    try {
      // final sharedPrefs = await SharedPreferencesServiceImpl.create();
      // final employeeId = sharedPrefs.fetch(key: CacheKey.employeeId);
      final employeeId = 'cmd9tdtmx0000wsl4i33r0v37';
      final response = await AttendanceRepositoryImpl().getAttendance(
        employeeId: employeeId,
        month: '$month',
      );
      debugPrint("\n\n Month Data $response\n\n");

      final List<DayRecord> records = (response)
          .map<DayRecord>((json) => DayRecord.fromJson(json))
          .toList();

      state = records;
    } catch (e) {
      throw Exception('Failed to fetch month records: $e');
    }
  }
}

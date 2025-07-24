abstract class AttendanceRepository {
  Future<List<dynamic>> getAttendance({
    required String employeeId,
    required String month,
  });
  Future<void> submitAttendance({
    required String projectId,
    required String startTime,
    required String lunchStartTime,
    required String lunchEndTime,
    required String endTime,
    required String date,
    required String address,
  });
}

abstract class MonthChartRepository {
  Future<Map<String, dynamic>> fetchMonthChart({
    required String employeeId,
    required String month,
  });
}

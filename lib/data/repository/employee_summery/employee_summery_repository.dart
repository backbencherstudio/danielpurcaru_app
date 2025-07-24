abstract class EmploySummeryRepository{
  Future<Map<String,dynamic>> getEmployeeSummary({required String employeeId});
}
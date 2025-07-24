import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services_impl.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/services/network/api_endpoints.dart';
import '../../../core/services/network/api_services.dart';
import 'employee_summery_repository.dart';

class EmployeeSummeryRepositoryImpl extends EmploySummeryRepository {
  @override
  Future<Map<String, dynamic>> getEmployeeSummary({
    required String employeeId,
  }) async {
    try {
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final token = sharedPrefs.fetch(key: CacheKey.authToken);
      debugPrint('Token: $token');

      final String endPoint = '${ApiEndpoints.employeeSummery}/$employeeId';
      debugPrint('fetching: $endPoint');
      final response = await ApiServices.fetchData(
        endPoints: endPoint,
        headers: {'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response['success'] == true) {
        debugPrint('Employee summary fetched: $response');
        return response['data'];
      } else {
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception('Error: ${e.toString()}');
    }
  }
}

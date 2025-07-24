import 'package:flutter/cupertino.dart';

import '../../../core/services/chache/shared_preferences_services.dart';
import '../../../core/services/chache/shared_preferences_services_impl.dart';
import '../../../core/services/network/api_endpoints.dart';
import '../../../core/services/network/api_services.dart';
import 'month_chart_repository.dart';

class MonthChartRepositoryImpl extends MonthChartRepository {
  @override
  Future<Map<String, dynamic>> fetchMonthChart({
    required String employeeId,
    required String month,
  }) async {
    final sharedPrefs = await SharedPreferencesServiceImpl.create();
    final token = sharedPrefs.fetch(key: CacheKey.authToken);

    debugPrint('Token: $token');

    final response = await ApiServices.fetchData(
      // <-- FIXED HERE
      endPoints:
          '${ApiEndpoints.employeeSummery}/$employeeId/month-summary?month=$month',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

   // debugPrint('Response: $response');

    if (response['success'] == true) {
      debugPrint('Month summary fetched: $response');
      return response['data'];
    } else {
      throw Exception(response['message']);
    }
  }
}

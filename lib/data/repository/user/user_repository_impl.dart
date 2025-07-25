import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/network/api_endpoints.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/network/api_services.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/services/chache/shared_preferences_services_impl.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository{
  @override
  @override
  Future<Map<String, dynamic>> fetchUser() async {
    try {
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final String userId = sharedPrefs.fetch(key: CacheKey.employeeId);
      final String authToken = sharedPrefs.fetch(key: CacheKey.authToken);

      debugPrint(userId);
      debugPrint(authToken);

      if (userId.isEmpty || authToken.isEmpty) {
        throw Exception("User ID or Auth token is missing");
      }

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      };

      final response = await ApiServices.fetchData(
        endPoints: ApiEndpoints.user,
        headers: headers,
      );

      debugPrint(response.toString());
      return response;
    } catch (e) {
      debugPrint("User fetch error: $e");
      rethrow;
    }
  }
}
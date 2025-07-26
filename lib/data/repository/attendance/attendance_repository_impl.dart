import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:danielpurcaru_time_tracker_app/core/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/services/chache/shared_preferences_services.dart';
import '../../../core/services/chache/shared_preferences_services_impl.dart';
import '../../../core/services/network/api_endpoints.dart';
import '../../../core/services/network/api_services.dart';
import 'attentance_repository.dart';

class AttendanceRepositoryImpl extends AttendanceRepository {
  @override
  Future<List<dynamic>> getAttendance({
    required String employeeId,
    required String month,
  }) async {
    final sharedPrefs = await SharedPreferencesServiceImpl.create();
    final token = sharedPrefs.fetch(key: CacheKey.authToken);

    final response = await ApiServices.fetchData(
      endPoints: '${ApiEndpoints.attendance}/$employeeId?month=$month',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response['success'] == true) {
      final data = response['data'];
      if (data is List) {
        return data;
      } else {
        throw Exception('Expected a list in "data" field');
      }
    } else {
      throw Exception(response['message']);
    }
  }

  @override
  Future<void> submitAttendance({
    required String projectId,
    required String startTime,
    required String lunchStartTime,
    required String lunchEndTime,
    required String endTime,
    required String date,
    required String address,
  }) async {
    try {
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final token = sharedPrefs.fetch(key: CacheKey.authToken);
      final employeeId = sharedPrefs.fetch(key: CacheKey.employeeId);

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'user_id': employeeId,
        'project_id': projectId,
        'date': date,
        'start_time': startTime,
        'lunch_start': lunchStartTime,
        'lunch_end': lunchEndTime,
        'end_time': endTime,
        'address': address,
      };

      final response = await ApiServices.postData(
        endPoints: ApiEndpoints.attendancePost,
        headers: headers,
        body: body,
      );

      if (response['success'] == true) {
        debugPrint('Response: $response');
        debugPrint('Attendance submitted successfully');
        Utils.showToast(
          message: 'Attendance submitted successfully',
          backgroundColor: AppColorScheme.successful,
          textColor: AppColorScheme.secondary,
        );
      } else {
        final message = response['message'] ?? 'Failed to submit attendance';
        debugPrint('Response: $response');
        debugPrint('Attendance submission error: $message');
        Utils.showToast(
          message: message,
          backgroundColor: AppColorScheme.error,
          textColor: Colors.white,
        );
        throw Exception(message);
      }
    } catch (e) {
      debugPrint('Attendance submission error: $e');
      rethrow; // Let the UI show error (handled below)
    }
  }
}

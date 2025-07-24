import 'dart:convert';

import 'package:danielpurcaru_time_tracker_app/core/services/network/api_endpoints.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/network/api_services.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/project/project_reository.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../../core/services/chache/shared_preferences_services.dart';
import '../../../core/services/chache/shared_preferences_services_impl.dart';

class ProjectRepositoryImpl extends ProjectRepository {
  @override
  Future<dynamic> fetchProject({
    required String userId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final token = sharedPrefs.fetch(key: CacheKey.authToken);
      // final token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6Im5pcm9iQGdtYWlsLmNvbSIsInN1YiI6ImNtZDlycmZlaTAwMDBqaDR3bDdla2puazIiLCJpYXQiOjE3NTI5MDA2NTMsImV4cCI6MTc1Mjk4NzA1M30.q2yG7aJO6EIrpT_uk9CXkzJe4dAF86EbbT7riC9Sb1A";
      final userId = sharedPrefs.fetch(key: CacheKey.employeeId);
      //final userId = 'cmcsy3x090000wsd4r4ap187i';

      final headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };

      final body = {
        'user_id': userId,
        'start_date': startDate,
        'end_date': endDate,
      };

      final uri = Uri.parse(
        '${ApiEndpoints.baseUrl}/project',
      ).replace(queryParameters: body);

      final response = await http.get(uri, headers: headers);
      return jsonDecode(response.body);
    } catch (e) {
      throw Exception(e);
    }

    // TODO: implement fetchProject
    throw UnimplementedError();
  }
}

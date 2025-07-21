import 'dart:convert';

import 'package:danielpurcaru_time_tracker_app/core/services/network/api_endpoints.dart';
import 'package:danielpurcaru_time_tracker_app/core/theme/theme_extension/color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../utils/utils.dart';

class ApiServices {
  static final ApiServices instance = ApiServices._internal();
  ApiServices._internal();

  static Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  static Future<Map<String, dynamic>> fetchData({
    required String endPoints,
    required Map<String, String>? headers,
  }) async {
    try {
      final response = await http.get(
        Uri.parse('${ApiEndpoints.baseUrl}/$endPoints'),
        headers: headers,
      );
      return _handleResponse(response);
    } catch (e) {
      throw Exception("Failed to send data: $e");
    }
  }

  static Future<Map<String, dynamic>> postData({
    required String endPoints,
    required Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      final String uri = '${ApiEndpoints.baseUrl}/$endPoints';
      debugPrint('URI: $uri');
      final response = await http.post(
        Uri.parse(uri),
        headers: headers,
        body: json.encode(body),
      );
      return _handleResponse(response);
    } catch (e) {
      Utils.showToast(
        message: e.toString(),
        backgroundColor: AppColorScheme.error,
        textColor: AppColorScheme.onError,
      );
      throw Exception("Failed to send data: $e");
    }
  }
}

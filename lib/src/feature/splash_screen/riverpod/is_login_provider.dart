import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final isLoggedInProvider = FutureProvider<bool>((ref) async {
  final prefs = await SharedPreferencesServiceImpl.create();
  final token = prefs.get(key: CacheKey.authToken);
  return token != null;
});

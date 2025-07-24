import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/foundation.dart';
import 'package:danielpurcaru_time_tracker_app/src/feature/home_screen/model/employee_summery_model.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/employee_summery/employee_summery_repository_impl.dart';
import '../../../../../core/services/chache/shared_preferences_services_impl.dart';

// Provider for Repository
final employeeSummaryRepoProvider = Provider((ref) {
  return EmployeeSummeryRepositoryImpl();
});

// Notifier Provider
final employeeSummaryNotifierProvider = StateNotifierProvider<
    EmployeeSummeryRepositoryNotifier, EmployeeSummeryModel>((ref) {
  return EmployeeSummeryRepositoryNotifier(ref);
});

// Notifier
class EmployeeSummeryRepositoryNotifier
    extends StateNotifier<EmployeeSummeryModel> {
  final Ref _ref;

  EmployeeSummeryRepositoryNotifier(this._ref)
      : super(
    EmployeeSummeryModel(
      employeeName: '',
      role: '',
      totalHours: 0,
      parHours: 0,
      earning: 0,
    ),
  );

  Future<void> fetchSummary() async {
    try {
      debugPrint('Fetching employee summary...');

      final repository = _ref.read(employeeSummaryRepoProvider);
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      final employeeId = sharedPrefs.fetch(key: CacheKey.employeeId);
     // final employeeId = 'cmd9tdtmx0000wsl4i33r0v37';

      final data = await repository.getEmployeeSummary(
        employeeId: employeeId,
      );

      state = EmployeeSummeryModel.fromJson(data);

      debugPrint('Employee summary updated in state: $state');
    } catch (e) {
      debugPrint('Error fetching employee summary: $e');
    }
  }
}

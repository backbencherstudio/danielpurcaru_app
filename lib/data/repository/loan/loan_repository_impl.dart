import 'package:danielpurcaru_time_tracker_app/core/services/chache/shared_preferences_services_impl.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/network/api_endpoints.dart';
import 'package:danielpurcaru_time_tracker_app/core/services/network/api_services.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/loan/loan_repository.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/services/chache/shared_preferences_services.dart';
import '../../../core/theme/theme_extension/color_scheme.dart';
import '../../../core/utils/utils.dart';

class LoanRepositoryImpl extends LoanRepository {
  @override
  Future<void> postLoan({required int amount}) async {
    // TODO: implement postLoan

    try {
      final prefs = await SharedPreferencesServiceImpl.create();
      final employeeId = prefs.fetch(key: CacheKey.employeeId);
      final authToken = prefs.fetch(key: CacheKey.authToken);

      final response = await ApiServices.postData(
        endPoints: ApiEndpoints.loan,
        headers: {'Content-Type': 'application/json',
        'authorization': 'Bearer $authToken'
        },
        body: {
          "user_id": employeeId,
          "loan_amount": amount
        },
      );
      debugPrint("\n\nLoan: $response\n\n");
      if (response['success'] == true) {
        Utils.showToast(
          message: 'Loan applied successfully',
          backgroundColor: AppColorScheme.successful,
          textColor: AppColorScheme.secondary,
        );
        return;
      } else {
        Utils.showToast(
          message: response['message'],
          backgroundColor: AppColorScheme.error,
          textColor: AppColorScheme.secondary,
        );
        throw Exception(response['message']);
      }
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}

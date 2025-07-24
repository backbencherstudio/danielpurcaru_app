import 'package:danielpurcaru_time_tracker_app/core/services/network/api_services.dart';
import 'package:danielpurcaru_time_tracker_app/data/jwt_token_decoder/jwt_token_decoder.dart';
import 'package:danielpurcaru_time_tracker_app/data/repository/auth/auth_repository.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/routes/route_const.dart';
import '../../../core/services/chache/shared_preferences_services.dart';
import '../../../core/services/chache/shared_preferences_services_impl.dart';
import '../../../core/services/network/api_endpoints.dart';
import '../../../core/theme/theme_extension/color_scheme.dart';
import '../../../core/utils/utils.dart';

class AuthRepositoryImpl extends AuthRepository {
  ApiServices apiService = ApiServices.instance;

  @override
  Future<String> login({
    required String email,
    required String password,
  }) async {
    // TODO: implement login

    final body = {'identifier': email, 'password': password};

    debugPrint('Auth Login Body: $body');

    final response = await ApiServices.postData(
      endPoints: ApiEndpoints.login,
      body: body,
      headers: {'Content-Type': 'application/json'},
    );

    debugPrint('\n \n Auth Login Response: $response \n \n');

    if (response['success'] == true) {
      debugPrint('Auth Login Token: ${response['authorization']['token']}');
      final sharedPrefs = await SharedPreferencesServiceImpl.create();
      await sharedPrefs.save(
        key: CacheKey.authToken,
        value: response['authorization']['token'],
      );
      await sharedPrefs.save(
        key: CacheKey.employeeId,
        value: JwtTokenDecoder.getSub(response['authorization']['token']),
      );
      //debugPrint();
      debugPrint('Employ id: ${JwtTokenDecoder.getSub(response['authorization']['token'])}');
      Utils.showToast(
        message: 'Logged in successfully',
        backgroundColor: AppColorScheme.successful,
        textColor: AppColorScheme.onError,
      );
      return RouteName.homeScreen;
    } else {
      debugPrint('Auth Login Error: ${response['message']}');
      return '';
    }
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> forgetPassword({required String email}) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<void> updatePassword({
    required String oldPassword,
    required String newPassword,
  }) {
    // TODO: implement updatePassword
    throw UnimplementedError();
  }
}

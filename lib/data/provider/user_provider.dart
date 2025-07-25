import 'package:danielpurcaru_time_tracker_app/data/model/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/user/user_repository_impl.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref) {
  return UserNotifier();
});

class UserNotifier extends StateNotifier<User> {
  UserNotifier()
    : super(
        User(
          id: '',
          name: '',
          email: '',
          avatar: '',
          avatarUrl: '',
          employeeRole: '',
        ),
      );
  Future<void> fetchUser() async {
    // TODO: implement fetchUser
    try {
      final response = await UserRepositoryImpl().fetchUser();
      debugPrint(response.toString());
      state = User.fromJson(response['data']);
    } catch (e) {
      debugPrint("User Provider: $e");
    }

  }
}

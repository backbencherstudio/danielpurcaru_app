import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../data/repository/project/project_repository_impl.dart';
import '../model/project_model.dart';

final selectedProjectProvider = StateProvider<Project?>((ref) => null);


final projectProvider =
StateNotifierProvider<ProjectNotifier, AsyncValue<List<Project>>>(
      (ref) => ProjectNotifier(),
);

class ProjectNotifier extends StateNotifier<AsyncValue<List<Project>>> {
  ProjectNotifier() : super(const AsyncLoading());

  Future<dynamic> fetchProjects({
    required String userId,
    required String startDate,
    required String endDate,
  }) async {
    try {
      state = const AsyncLoading();
      final response = await ProjectRepositoryImpl().fetchProject(
        userId: userId,
        startDate: startDate,
        endDate: endDate,
      );
      debugPrint('\n \n  res from provider riverpod :$response');

      final data = (response["data"] as List)
          .map((e) => Project.fromJson(e as Map<String, dynamic>))
          .toList();

      state = AsyncData(data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

}

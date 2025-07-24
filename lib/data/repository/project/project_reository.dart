abstract class ProjectRepository {
  Future<dynamic> fetchProject({
    required String userId,
    required String startDate,
    required String endDate,
  });
}

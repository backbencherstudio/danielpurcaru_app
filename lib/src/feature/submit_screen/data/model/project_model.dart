class Project {
  final String id;
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String priority;
  final String? cost;
  final String price;
  final int status;
  final List<Assignee> assignees;

  Project({
    required this.id,
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.priority,
    required this.cost,
    required this.price,
    required this.status,
    required this.assignees,
  });

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      startDate: DateTime.tryParse(json['start_date'] ?? '') ?? DateTime.now(),
      endDate: DateTime.tryParse(json['end_date'] ?? '') ?? DateTime.now(),
      priority: json['priority'] ?? '',
      cost: json['cost']?.toString(),
      price: json['price']?.toString() ?? '0',
      status: json['status'] is int ? json['status'] : int.tryParse(json['status'].toString()) ?? 0,
      assignees: (json['assignees'] as List<dynamic>? ?? [])
          .map((e) => Assignee.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

class Assignee {
  final DateTime createdAt;
  final User user;

  Assignee({
    required this.createdAt,
    required this.user,
  });

  factory Assignee.fromJson(Map<String, dynamic> json) {
    return Assignee(
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      user: User.fromJson(json['user'] ?? {}),
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String avatarUrl;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
    );
  }
}

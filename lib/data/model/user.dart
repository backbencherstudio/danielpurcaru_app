class User {
  final String id;
  final String? firstName;
  final String? lastName;
  final String name;
  final String? email;
  final String? avatar;
  final String? avatarUrl;
  final String? employeeRole;
  final String? salary;
  final String? department;
  final String? designation;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.avatarUrl,
    required this.employeeRole,
    this.firstName,
    this.lastName,
    this.salary,
    this.department,
    this.designation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      avatar: json['avatar'] ?? '',
      avatarUrl: json['avatarUrl'] ?? '',
      employeeRole: json['employee_role'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      salary: json['salary']?.toString()??'',
      department: json['department'] ?? '',
      designation: json['designation'] ?? '',
    );
  }
}

class EmployeeSummeryModel {
  //final String employeeName
  final String employeeName;
  final String role;
  final num totalHours;
  final num parHours;
  final num earning;

  EmployeeSummeryModel({
    required this.employeeName,
    required this.role,
    required this.totalHours,
    required this.parHours,
    required this.earning,
  });

  factory EmployeeSummeryModel.fromJson(Map<String, dynamic> json) {
    return EmployeeSummeryModel(
      employeeName: json['name'],
      role: json['role'],
      totalHours: json['totalHours'],
      parHours: json['perHour'],
      earning: json['earning'],
    );
  }
  EmployeeSummeryModel copyWith({
    String? employeeName,
    String? role,
    num? totalHours,
    num? parHours,
    num? earning,
  }) {
    return EmployeeSummeryModel(
      employeeName: employeeName ?? this.employeeName,
      role: role ?? this.role,
      totalHours: totalHours ?? this.totalHours,
      parHours: parHours ?? this.parHours,
      earning: earning ?? this.earning,
    );
  }
}

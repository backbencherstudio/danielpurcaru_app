class DayStatusModel {
  final String date;
  final String status;

  DayStatusModel({
    required this.date,
    required this.status,
  });

  factory DayStatusModel.fromJson(Map<String, dynamic> json) {
    return DayStatusModel(
      date: json['date'] ?? '',
      status: json['status'] ?? '',
    );
  }
}

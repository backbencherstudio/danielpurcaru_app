class MonthRecords {
  final int days;
  final int totalHours;
  final double totalEarning;

  MonthRecords({
    required this.days,
    required this.totalHours,
    required this.totalEarning,
  });
  factory MonthRecords.fromJson(Map<String, dynamic> json) {
    return MonthRecords(
      days: json['days'],
      totalHours: json['total_hours'],
      totalEarning: json['total_earning'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'days': days as String,
      'total_hours': totalHours as String ,
      'total_earning': totalEarning as String,
    };
  }
}

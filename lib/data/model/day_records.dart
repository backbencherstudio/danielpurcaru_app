class DayRecord {
  final DateTime date;
  final DateTime? startTime;
  final DateTime? lunchStartTime;
  final DateTime? lunchEndTime;
  final DateTime? endTime;
  final String totalHours;
  final double earning;

  DayRecord({
    required this.date,
    this.startTime,
    this.lunchStartTime,
    this.lunchEndTime,
    this.endTime,
    required this.totalHours,
    required this.earning,
  });

  /// Convert a JSON map to a DayRecord object
  factory DayRecord.fromJson(Map<String, dynamic> json) {
    return DayRecord(
      date: DateTime.parse(json['date']),
      startTime: json['startTime'] != null
          ? DateTime.parse(json['startTime'])
          : null,
      lunchStartTime: json['lunchStartTime'] != null
          ? DateTime.parse(json['lunchStartTime'])
          : null,
      lunchEndTime: json['lunchEndTime'] != null
          ? DateTime.parse(json['lunchEndTime'])
          : null,
      endTime: json['endTime'] != null ? DateTime.parse(json['endTime']) : null,
      totalHours: json['totalHours'] ?? '',
      earning: json['earning'] != null
          ? (json['earning'] is double
                ? json['earning']
                : double.tryParse(json['earning'].toString()) ?? 0.0)
          : 0.0,
    );
  }

  /// Convert a DayRecord object to a JSON map
  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'startTime': startTime?.toIso8601String(),
      'lunchStartTime': lunchStartTime?.toIso8601String(),
      'lunchEndTime': lunchEndTime?.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'totalHours': totalHours,
      'earning': earning,
    };
  }
}

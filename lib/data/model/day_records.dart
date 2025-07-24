class DayRecord {
  final String employeeId;
  final DateTime date;
  final DateTime? startTime;
  final String? lunchTime;
  final DateTime? endTime;
  final String totalHours;
  final double earning;

  DayRecord({
    required this.employeeId,
    required this.date,
    this.startTime,
    this.lunchTime,
    this.endTime,
    required this.totalHours,
    required this.earning,
  });

  /// Convert a JSON map to a DayRecord object
  factory DayRecord.fromJson(Map<String, dynamic> json) {
    bool isValidDate(String? value) {
      if (value == null || value.trim() == '' || value.trim() == '----') return false;
      try {
        DateTime.parse(value);
        return true;
      } catch (_) {
        return false;
      }
    }

    return DayRecord(
      employeeId: json['id'] ?? '',
      date: DateTime.parse(json['date']), // Assuming this is always valid
      startTime: isValidDate(json['start_time']) ? DateTime.parse(json['start_time']) : null,
      lunchTime: json['lunch'] ?? '---',
      endTime: isValidDate(json['end_time']) ? DateTime.parse(json['end_time']) : null,
      totalHours: json['total'] ?? 'No Record',
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
      'id': employeeId,
      'date': date.toIso8601String(),
      'start_time': startTime?.toIso8601String(),
      'lunch': lunchTime,
      'end_time': endTime?.toIso8601String(),
      'total': totalHours,
      'earning': earning,
    };
  }
}

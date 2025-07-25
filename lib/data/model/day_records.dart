class DayRecord {
  final String employeeId;
  final DateTime date;
  final String? startTime;
  final String? lunchTime;
  final String? endTime;
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
      startTime: json['start_time'] ??'',
      lunchTime: json['lunch'] ?? '---',
      endTime: json['end_time'] ??'',
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
      'start_time': startTime,
      'lunch': lunchTime,
      'end_time': endTime,
      'total': totalHours,
      'earning': earning,
    };
  }
}

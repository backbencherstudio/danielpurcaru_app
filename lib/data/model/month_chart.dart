import 'day_status_model.dart';

class MonthChartModel {
  final num complete;
  final num unfinished;
  final num percentComplete;
  final num percentUnfinished;
  final num totalWorkingDays;
  final List<DayStatusModel> days;

  MonthChartModel({
    required this.complete,
    required this.unfinished,
    required this.percentComplete,
    required this.percentUnfinished,
    required this.totalWorkingDays,
    required this.days,
  });

  factory MonthChartModel.fromJson(Map<String, dynamic> json) {
    return MonthChartModel(
      complete: json['complete'],
      unfinished: json['unfinished'],
      percentComplete: json['percentComplete'],
      percentUnfinished: json['percentUnfinished'],
      totalWorkingDays: json['totalWorkingDays'],
      days: (json['days'] as List)
          .map((dayJson) => DayStatusModel.fromJson(dayJson))
          .toList(),
    );
  }
}

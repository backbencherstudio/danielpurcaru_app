import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils {
  static String formatTime(DateTime? time) {
    if (time != null) {
      return DateFormat('H:mm').format(time);
    }
    return '--';
  }

  static String formatLunchTime(DateTime? startTime, DateTime? endTime, bool isLunch) {
    if (startTime != null && endTime != null) {
      return '${DateFormat('H').format(startTime)}-${DateFormat('H').format(endTime)}';
    }
    return '--';
  }

  static void showToast({required String message, required Color backgroundColor, required Color textColor}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: 16.0
    );
  }

  /// Parses time string like "6:50 PM" to 24-hour int hour and minute.
  static TimeOfDay parseTime(String timeStr) {
    final format = RegExp(r'(\d+):(\d+) (\w{2})');
    final match = format.firstMatch(timeStr);

    if (match == null) {
      throw FormatException("Invalid time format: $timeStr");
    }

    int hour = int.parse(match.group(1)!);
    int minute = int.parse(match.group(2)!);
    final meridian = match.group(3);

    if (meridian == 'PM' && hour != 12) {
      hour += 12;
    } else if (meridian == 'AM' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  /// Combines a date string ("2025-07-20") and a time string ("6:50 PM") into ISO8601 datetime string.
  static String combineDateAndTime(String date, String timeStr) {
    final time = parseTime(timeStr);
    final dateTime = DateTime.parse(date).copyWith(hour: time.hour, minute: time.minute);
    // return without milliseconds for API compatibility
    return dateTime.toIso8601String().split('.').first;
  }
}

/// Extension method to mimic copyWith for DateTime
extension DateTimeCopyWith on DateTime {
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}

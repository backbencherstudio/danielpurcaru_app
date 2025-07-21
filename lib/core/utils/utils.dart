import 'dart:ui';

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
}

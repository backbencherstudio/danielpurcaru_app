import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/month_name/moth_names.dart';

final monthSelectionProvider = StateNotifierProvider<MonthSelectorNotifier, MonthName?>((ref) {
  return MonthSelectorNotifier();
});

class MonthSelectorNotifier extends StateNotifier<MonthName?> {
  MonthSelectorNotifier() : super(null);

  // Select the month and update the state
  Future<void> selectMonth(int index) async {
    // Set the state to the selected month
    state = MonthName.values[index];

    // Adding delay (if required)
    await Future.delayed(Duration(seconds: 2000));
  }
}

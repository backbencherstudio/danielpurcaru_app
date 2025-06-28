import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../data/month_name/moth_names.dart';

final monthSelectionProvider = StateNotifierProvider<MonthSelectorNotifier, MonthName?>((ref) {
  return MonthSelectorNotifier();
});

class MonthSelectorNotifier extends StateNotifier<MonthName?> {
  MonthSelectorNotifier() : super(null);

  Future<void> selectMonth(int index) async {
    state = MonthName.values[index];

    await Future.delayed(Duration(milliseconds: 500));
  }
}

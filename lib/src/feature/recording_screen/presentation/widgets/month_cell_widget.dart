import 'package:flutter/material.dart';
import '../../../../../core/theme/theme_extension/color_scheme.dart';

class MonthCellWidget extends StatelessWidget {
  final String monthName;
  final bool isSelected;
  const MonthCellWidget({
    super.key,
    required this.monthName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(
        color: isSelected ? AppColorScheme.primary : Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(child: Text(monthName, style: textTheme.bodyLarge)),
    );
  }
}
import 'package:flutter/material.dart';

import '../../../../../core/theme/theme_extension/color_scheme.dart';
class StatisticsCard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;

  const StatisticsCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColorScheme.secondary,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Text(title, style: textTheme.bodyMedium, textAlign: TextAlign.center),
          SizedBox(height: 8.0), // Adds some space between the title and value
          Text(
            value,
            style: textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
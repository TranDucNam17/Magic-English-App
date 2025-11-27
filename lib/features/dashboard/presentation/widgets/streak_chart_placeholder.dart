// lib/features/dashboard/presentation/widgets/streak_chart_placeholder.dart
import 'package:flutter/material.dart';

class StreakChartPlaceholder extends StatelessWidget {
  const StreakChartPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Center(
        child: Text(
          '[Placeholder for Activity Line/Bar Chart]',
          style: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}

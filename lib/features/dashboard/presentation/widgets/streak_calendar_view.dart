// lib/features/dashboard/presentation/widgets/streak_calendar_view.dart
import 'package:flutter/material.dart';

class StreakCalendarView extends StatelessWidget {
  final Map<int, bool> activityData; // Map từ ngày -> trạng thái active

  const StreakCalendarView({super.key, required this.activityData});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: activityData.length,
          itemBuilder: (context, index) {
            final day = index + 1;
            final isActive = activityData[day] ?? false;
            return Container(
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF66BB6A) // Magic English Green (light)
                    : Colors.grey.shade200,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$day',
                  style: TextStyle(
                    color: isActive ? Colors.white : Colors.grey.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

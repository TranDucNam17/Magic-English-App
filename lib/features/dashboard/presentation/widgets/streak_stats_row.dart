// lib/features/dashboard/presentation/widgets/streak_stats_row.dart
import 'package:flutter/material.dart';

class StreakStatsRow extends StatelessWidget {
  final int bestStreak;
  final int totalActiveDays;

  const StreakStatsRow({
    super.key,
    required this.bestStreak,
    required this.totalActiveDays,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildStatItem(
            context,
            icon: Icons.emoji_events,
            label: 'Best Streak',
            value: '$bestStreak days',
            color: Colors.orange.shade700,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildStatItem(
            context,
            icon: Icons.calendar_today,
            label: 'Total Active Days',
            value: '$totalActiveDays days',
            color: Colors.blue.shade700,
          ),
        ),
      ],
    );
  }

  Widget _buildStatItem(BuildContext context,
      {required IconData icon,
        required String label,
        required String value,
        required Color color}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 28),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 14),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

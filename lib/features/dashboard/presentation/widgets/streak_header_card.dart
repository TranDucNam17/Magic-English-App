// lib/features/dashboard/presentation/widgets/streak_header_card.dart
import 'package:flutter/material.dart';

class StreakHeaderCard extends StatelessWidget {
  final int currentStreak;

  const StreakHeaderCard({super.key, required this.currentStreak});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: const Color(0xFF2E7D32).withOpacity(0.3),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: const Color(0xFF2E7D32),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            const Text(
              '🔥',
              style: TextStyle(fontSize: 48),
            ),
            const SizedBox(height: 8),
            Text(
              '$currentStreak Days',
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Current Streak',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// lib/features/dashboard/presentation/widgets/achievements_preview.dart
import 'package:flutter/material.dart';

class AchievementsPreview extends StatelessWidget {
  const AchievementsPreview({super.key, required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả cho UI
    final badges = ['🥇', '🥉', '🥈', '🔒', '🔒', '🔒'];
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: badges.length,
        itemBuilder: (context, index) {
          final isLocked = badges[index] == '🔒';
          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isLocked ? Colors.grey.shade200 : Colors.amber.shade100,
                border: Border.all(color: isLocked ? Colors.grey.shade300 : Colors.amber.shade400, width: 2),
              ),
              child: Center(
                child: Text(badges[index], style: const TextStyle(fontSize: 30)),
              ),
            ),
          );
        },
      ),
    );
  }
}

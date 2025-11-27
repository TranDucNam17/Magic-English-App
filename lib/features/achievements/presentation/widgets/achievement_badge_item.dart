// lib/features/achievements/presentation/widgets/achievement_badge_item.dart

import 'package:flutter/material.dart';
import 'package:btlmagicenglish/features/achievements/models/achievement_model.dart';

class AchievementBadgeItem extends StatelessWidget {
  final Achievement achievement;
  final VoidCallback onTap;

  const AchievementBadgeItem({
    super.key,
    required this.achievement,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isUnlocked = achievement.isUnlocked;
    final color = isUnlocked ? const Color(0xFF2E7D32) : Colors.grey.shade500;
    final bgColor = isUnlocked ? Colors.white : Colors.grey.shade100;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Card(
        elevation: isUnlocked ? 2.0 : 0.0,
        shadowColor: isUnlocked ? color.withOpacity(0.3) : Colors.transparent,
        color: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: isUnlocked ? Colors.grey.shade200 : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon Badge
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isUnlocked ? color.withOpacity(0.15) : Colors.grey.shade200,
                ),
                child: Icon(
                  isUnlocked ? achievement.iconData : Icons.lock_outline,
                  size: 40,
                  color: color,
                ),
              ),
              const Spacer(),
              // Title
              Text(
                achievement.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isUnlocked ? Colors.black87 : Colors.grey.shade700,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              // Description
              Text(
                achievement.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

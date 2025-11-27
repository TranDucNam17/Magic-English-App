// lib/features/achievements/models/achievement_model.dart

import 'package:flutter/material.dart';

class Achievement {
  final IconData iconData;
  final String title;
  final String description;
  final bool isUnlocked;

  Achievement({
    required this.iconData,
    required this.title,
    required this.description,
    this.isUnlocked = false,
  });
}

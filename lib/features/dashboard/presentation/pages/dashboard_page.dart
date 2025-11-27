// lib/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/material.dart';
// 1. IMPORT CÁC PAGE CẦN THIẾT
import 'package:btlmagicenglish/features/dashboard/presentation/pages/daily_streak_page.dart';
import 'package:btlmagicenglish/features/achievements/presentation/pages/achievements_page.dart';
import 'package:btlmagicenglish/features/notifications/presentation/pages/notifications_page.dart'; // <-- THÊM DÒNG NÀY

import '../../../achievements/presentation/widgets/achievements_preview.dart';
import '../widgets/cefr_chart_preview.dart';
import '../widgets/stats_card.dart';
import '../widgets/streak_card.dart';
import '../widgets/word_type_chart_preview.dart';


class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  void _navigateToDailyStreak(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const DailyStreakPage(),
      ),
    );
  }

  void _navigateToAchievements(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const AchievementsPage(),
      ),
    );
  }

  // 2. TẠO HÀM ĐIỀU HƯỚNG RIÊNG CHO NOTIFICATIONS
  void _navigateToNotifications(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const NotificationsPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          // 3. CẬP NHẬT LOGIC onPressed CHO ICONBUTTON
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => _navigateToNotifications(context), // <-- THAY ĐỔI TẠI ĐÂY
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StreakCard(
                streakDays: 15,
                onTap: () => _navigateToDailyStreak(context),
              ),
              const SizedBox(height: 24),

              // ... (Phần còn lại của code không thay đổi)
              Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      icon: Icons.book_outlined,
                      label: 'Words Learned',
                      value: '128',
                      color: Colors.blue.shade400,
                      onTap: () => print("Words Card Tapped"),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: StatsCard(
                      icon: Icons.emoji_events_outlined,
                      label: 'Badges Earned',
                      value: '5',
                      color: Colors.orange.shade400,
                      onTap: () => print("Badges Card Tapped"),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              _buildSectionTitle(
                  context,
                  'Achievements',
                      () => _navigateToAchievements(context)
              ),
              const SizedBox(height: 12),
              AchievementsPreview(
                onTap: () => _navigateToAchievements(context),
              ),
              const SizedBox(height: 24),

              _buildSectionTitle(context, 'Proficiency Level (CEFR)', () => print("View CEFR Details")),
              const SizedBox(height: 12),
              CefrChartPreview(
                onTap: () => print("CEFR Chart Tapped"),
              ),
              const SizedBox(height: 24),

              _buildSectionTitle(context, 'Vocabulary Breakdown', () => print("View Vocab Details")),
              const SizedBox(height: 12),
              WordTypeChartPreview(
                onTap: () => print("Word-type Chart Tapped"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title, VoidCallback onViewAll) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        TextButton(
          onPressed: onViewAll,
          child: const Text(
            'View All',
            style: TextStyle(color: Color(0xFF2E7D32), fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

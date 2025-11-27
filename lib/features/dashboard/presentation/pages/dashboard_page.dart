// lib/features/dashboard/presentation/pages/dashboard_page.dart

import 'package:flutter/material.dart';
// 1. THÊM IMPORT ĐẾN DAILY_STREAK_PAGE
import 'package:btlmagicenglish/features/dashboard/presentation/pages/daily_streak_page.dart'; // <-- Thay 'magic_english' bằng tên project của bạn

import '../widgets/achievements_preview.dart';
import '../widgets/cefr_chart_preview.dart';
import '../widgets/stats_card.dart';
import '../widgets/streak_card.dart';
import '../widgets/word_type_chart_preview.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ViewModel/Bloc/Provider sẽ được inject ở đây sau này
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {
              // TODO: Navigate to Notifications screen
              print("Navigate to Notifications");
            },
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
              // 2. CẬP NHẬT LOGIC onTap TẠI ĐÂY
              StreakCard(
                streakDays: 15,
                onTap: () {
                  // Sử dụng Navigator.push để mở màn hình mới
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DailyStreakPage(),
                    ),
                  );
                },
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

              // 3. Achievements Section
              _buildSectionTitle(context, 'Achievements', () => print("View All Achievements")),
              const SizedBox(height: 12),
              AchievementsPreview(
                onTap: () => print("Achievements Preview Tapped"),
              ),
              const SizedBox(height: 24),

              // 4. CEFR Chart
              _buildSectionTitle(context, 'Proficiency Level (CEFR)', () => print("View CEFR Details")),
              const SizedBox(height: 12),
              CefrChartPreview(
                onTap: () => print("CEFR Chart Tapped"),
              ),
              const SizedBox(height: 24),

              // 5. Word-type Chart
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

  // Helper widget cho các tiêu đề section
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

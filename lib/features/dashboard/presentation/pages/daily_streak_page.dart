// lib/features/dashboard/presentation/pages/daily_streak_page.dart

import 'package:flutter/material.dart';
import '../widgets/streak_calendar_view.dart';
import '../widgets/streak_chart_placeholder.dart';
import '../widgets/streak_header_card.dart';
import '../widgets/streak_stats_row.dart';

class DailyStreakPage extends StatelessWidget {
  const DailyStreakPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Dữ liệu giả, sau này sẽ được cung cấp bởi ViewModel/Bloc
    const int currentStreak = 15;
    const int bestStreak = 42;
    const int totalActiveDays = 98;
    // Dữ liệu giả cho lịch: key là ngày, value là có active hay không
    final Map<int, bool> activityData = {
      for (var i = 1; i <= 30; i++) i: (i > 0 && i < 16) || (i % 5 == 0)
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Streak'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black87,
      ),
      backgroundColor: Colors.grey[50],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 1. Header Card - Hiển thị streak hiện tại
            const StreakHeaderCard(currentStreak: currentStreak),
            const SizedBox(height: 16),

            // 2. Stats Row - Các chỉ số phụ
            const StreakStatsRow(
              bestStreak: bestStreak,
              totalActiveDays: totalActiveDays,
            ),
            const SizedBox(height: 32),

            // 3. Lịch Streak
            _buildSectionTitle(context, 'Streak Calendar'),
            const SizedBox(height: 12),
            StreakCalendarView(activityData: activityData),
            const SizedBox(height: 32),

            // 4. Biểu đồ hoạt động
            _buildSectionTitle(context, 'Activity Chart'),
            const SizedBox(height: 12),
            const StreakChartPlaceholder(),
            const SizedBox(height: 32),

            // 5. Text động viên
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF2E7D32).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text(
                "You're on fire! 🔥 Keep pushing forward and make learning a daily habit.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF1B5E20),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper cho tiêu đề các section
  Widget _buildSectionTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

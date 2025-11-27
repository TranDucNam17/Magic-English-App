// lib/features/achievements/presentation/pages/achievements_page.dart

import 'package:flutter/material.dart';
import 'package:btlmagicenglish/features/achievements/models/achievement_model.dart';
import 'package:btlmagicenglish/features/achievements/presentation/widgets/achievement_badge_item.dart';// Model giả lập

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  @override
  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Dữ liệu giả, sau này sẽ được cung cấp bởi ViewModel/Bloc
  final List<Achievement> _allAchievements = [
    Achievement(
        iconData: Icons.star,
        title: 'First Step',
        description: 'Learned your first word.',
        isUnlocked: true),
    Achievement(
        iconData: Icons.school,
        title: 'Word Collector',
        description: 'Saved 50 new words.',
        isUnlocked: true),
    Achievement(
        iconData: Icons.local_fire_department,
        title: '7-Day Streak',
        description: 'Maintained a streak for 7 days.',
        isUnlocked: true),
    Achievement(
        iconData: Icons.quiz,
        title: 'Quiz Starter',
        description: 'Completed your first quiz.',
        isUnlocked: true),
    Achievement(
        iconData: Icons.auto_stories,
        title: 'Bookworm',
        description: 'Learned 100 words.',
        isUnlocked: false),
    Achievement(
        iconData: Icons.workspace_premium,
        title: 'Streak Hero',
        description: 'Maintained a 30-day streak.',
        isUnlocked: false),
    Achievement(
        iconData: Icons.verified,
        title: 'Grammar Guru',
        description: 'Fixed 50 grammar mistakes.',
        isUnlocked: false),
    Achievement(
        iconData: Icons.military_tech,
        title: 'Top Student',
        description: 'Achieved a perfect score in a quiz.',
        isUnlocked: false),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final unlockedCount = _allAchievements.where((a) => a.isUnlocked).length;
    final totalCount = _allAchievements.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achievements'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),
      ),
      backgroundColor: Colors.grey[50],
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(child: _buildOverviewCard(unlockedCount, totalCount)),
            SliverPersistentHeader(
              delegate: _SliverTabBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: const Color(0xFF2E7D32),
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorColor: const Color(0xFF2E7D32),
                  indicatorWeight: 3.0,
                  tabs: const [
                    Tab(text: 'All'),
                    Tab(text: 'Unlocked'),
                    Tab(text: 'Locked'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildAchievementsGrid(_allAchievements), // All
            _buildAchievementsGrid(_allAchievements.where((a) => a.isUnlocked).toList()), // Unlocked
            _buildAchievementsGrid(_allAchievements.where((a) => !a.isUnlocked).toList()), // Locked
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewCard(int unlocked, int total) {
    double progress = total > 0 ? unlocked / total : 0;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        elevation: 0,
        color: const Color(0xFFE8F5E9), // Light green background
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your Progress',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1B5E20),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '🏆 $unlocked / $total Unlocked',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    '${(progress * 100).toStringAsFixed(0)}%',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF2E7D32),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.black12,
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF2E7D32)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementsGrid(List<Achievement> achievements) {
    if (achievements.isEmpty) {
      return const Center(child: Text("No achievements in this category yet."));
    }
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.85,
      ),
      itemCount: achievements.length,
      itemBuilder: (context, index) {
        final achievement = achievements[index];
        return AchievementBadgeItem(
          achievement: achievement,
          onTap: () {
            print('Tapped on: ${achievement.title}');
            // TODO: Navigate to achievement detail screen or show a dialog
          },
        );
      },
    );
  }
}

// Helper class to make TabBar pinnable in NestedScrollView
class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverTabBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.grey[50], // Match scaffold background
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverTabBarDelegate oldDelegate) {
    return false;
  }
}


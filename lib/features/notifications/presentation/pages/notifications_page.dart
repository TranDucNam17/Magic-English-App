// lib/features/notifications/presentation/pages/notifications_page.dart

import 'package:flutter/material.dart';
import '../../models/notification_model.dart'; // Model giả lập
import '../widgets/notification_item.dart';
import '../widgets/notifications_empty_view.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  // Dữ liệu giả, sau này sẽ được cung cấp bởi ViewModel/Bloc
  final List<AppNotification> _notifications = [
    AppNotification(
      type: NotificationType.streak,
      title: 'Streak Reminder',
      body: "Don't forget to complete a lesson today to keep your 15-day streak!",
      time: '2 hours ago',
      isRead: false,
    ),
    AppNotification(
      type: NotificationType.achievement,
      title: 'New Badge Unlocked',
      body: "You've earned the 'Word Collector' badge. Keep it up!",
      time: 'Yesterday',
      isRead: false,
    ),
    AppNotification(
      type: NotificationType.content,
      title: 'New Vocabulary Set',
      body: 'A new set of words about "Travel" has been added.',
      time: '2 days ago',
      isRead: true,
    ),
    AppNotification(
      type: NotificationType.system,
      title: 'System Update',
      body: "We've added new features and improved performance. Update now!",
      time: '3 days ago',
      isRead: true,
    ),
  ];

  void _onMarkAllAsRead() {
    setState(() {
      for (var notification in _notifications) {
        notification.isRead = true;
      }
    });
    print("All notifications marked as read.");
  }

  void _onNotificationTapped(AppNotification notification) {
    print("Tapped on notification: ${notification.title}");
    // Logic điều hướng đến màn hình chi tiết tương ứng
    // Ví dụ: if (notification.type == NotificationType.streak) ...
    if (!notification.isRead) {
      setState(() {
        notification.isRead = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 1,
        shadowColor: Colors.grey.withOpacity(0.2),
        actions: [
          if (_notifications.any((n) => !n.isRead))
            TextButton(
              onPressed: _onMarkAllAsRead,
              child: const Text(
                'Mark all as read',
                style: TextStyle(
                  color: Color(0xFF2E7D32),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
        ],
      ),
      backgroundColor: Colors.grey[50],
      body: _notifications.isEmpty
          ? const NotificationsEmptyView()
          : ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final notification = _notifications[index];
          return NotificationItem(
            notification: notification,
            onTap: () => _onNotificationTapped(notification),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }
}

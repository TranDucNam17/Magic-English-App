// lib/features/notifications/models/notification_model.dart

enum NotificationType { streak, achievement, content, system }

class AppNotification {
  final NotificationType type;
  final String title;
  final String body;
  final String time;
  bool isRead;

  AppNotification({
    required this.type,
    required this.title,
    required this.body,
    required this.time,
    this.isRead = false,
  });
}

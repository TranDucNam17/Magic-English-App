// lib/features/notifications/presentation/widgets/notification_item.dart

import 'package:flutter/material.dart';
import '../../models/notification_model.dart';

class NotificationItem extends StatelessWidget {
  final AppNotification notification;
  final VoidCallback onTap;

  const NotificationItem({
    super.key,
    required this.notification,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isRead = notification.isRead;
    final bgColor = isRead ? Colors.white : const Color(0xFFE8F5E9);
    final iconColor =
    isRead ? Colors.grey.shade500 : const Color(0xFF2E7D32);

    return InkWell(
      onTap: onTap,
      child: Container(
        color: bgColor,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Icon(_getIconForType(notification.type), color: iconColor, size: 28),
            const SizedBox(width: 16),
            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: TextStyle(
                      fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.body,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notification.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),
            // Unread Indicator
            if (!isRead)
              Container(
                margin: const EdgeInsets.only(left: 12, top: 4),
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E7D32),
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForType(NotificationType type) {
    switch (type) {
      case NotificationType.streak:
        return Icons.local_fire_department_outlined;
      case NotificationType.achievement:
        return Icons.emoji_events_outlined;
      case NotificationType.content:
        return Icons.auto_stories_outlined;
      case NotificationType.system:
        return Icons.info_outline;
      default:
        return Icons.notifications_outlined;
    }
  }
}

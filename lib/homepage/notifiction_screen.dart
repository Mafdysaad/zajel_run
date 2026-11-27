import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zajel_run/homepage/widgets/notifictionModel.dart';
import 'package:zajel_run/l10n/app_localizations.dart';

class NotificationsScreen extends StatefulWidget {
  final List<AppNotification> notifications;
  final ValueChanged<int>? onUnreadCountChanged;

  const NotificationsScreen({
    super.key,
    required this.notifications,
    this.onUnreadCountChanged,
  });

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late List<AppNotification> notifications;

  int get unreadCount => notifications.where((item) => !item.isRead).length;

  @override
  void initState() {
    super.initState();
    notifications = widget.notifications;
  }

  void markAsRead(int index) {
    setState(() {
      notifications[index].isRead = true;
    });

    widget.onUnreadCountChanged?.call(unreadCount);
  }

  void markAllAsRead() {
    setState(() {
      for (final item in notifications) {
        item.isRead = true;
      }
    });

    widget.onUnreadCountChanged?.call(0);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notifications),
        actions: [
          if (unreadCount > 0)
            TextButton(
              onPressed: markAllAsRead,
              child: const Text('Mark all read'),
            ),
        ],
      ),
      body: notifications.isEmpty
          ? Center(child: Text(l10n.noNotifications))
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final item = notifications[index];

                return InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () => markAsRead(index),
                  child: Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: item.isRead
                          ? Colors.white
                          : const Color(0xFFEAF5F6),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE5E7EB)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF00616D)
                                .withValues(alpha: 0.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.notifications_active_outlined,
                            color: Color(0xFF00616D),
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontWeight: item.isRead
                                      ? FontWeight.w500
                                      : FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),

                              const SizedBox(height: 6),

                              Text(
                                item.body,
                                style: const TextStyle(
                                  color: Colors.black54,
                                  fontSize: 13,
                                ),
                              ),

                              const SizedBox(height: 8),

                              Text(
                                item.date,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),

                        if (!item.isRead)
                          Container(
                            width: 9,
                            height: 9,
                            decoration: const BoxDecoration(
                              color: Color(0xFF00616D),
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

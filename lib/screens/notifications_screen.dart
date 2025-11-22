import 'package:flutter/material.dart';
import '../widgets/card_widget.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  // Mock notifications data
  final List<NotificationItem> _notifications = [
    const NotificationItem(
      title: 'New Sale Completed',
      description: 'Your sale of ₹12,500 has been successfully recorded.',
      timestamp: '2h ago',
    ),
    const NotificationItem(
      title: 'Bet Won!',
      description: 'Congratulations! You won ₹5,000 on your recent bet.',
      timestamp: '5h ago',
    ),
    const NotificationItem(
      title: 'Weekly Report Ready',
      description: 'Your weekly sales report is now available for review.',
      timestamp: '1d ago',
    ),
    const NotificationItem(
      title: 'New Achievement Unlocked',
      description: 'You\'ve reached 100 sales milestone! Keep it up!',
      timestamp: '2d ago',
    ),
    const NotificationItem(
      title: 'Payment Received',
      description: 'Payment of ₹8,750 has been credited to your account.',
      timestamp: '3d ago',
    ),
    const NotificationItem(
      title: 'Team Challenge Started',
      description: 'A new team challenge has begun. Join now to compete!',
      timestamp: '4d ago',
    ),
    const NotificationItem(
      title: 'Profile Updated',
      description: 'Your profile information has been successfully updated.',
      timestamp: '5d ago',
    ),
    const NotificationItem(
      title: 'Leaderboard Update',
      description: 'You\'ve moved up 3 positions in the leaderboard!',
      timestamp: '1w ago',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
        child: _notifications.isEmpty
            ? const Center(
                child: Text(
                  'No notifications',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemCount: _notifications.length,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final notification = _notifications[index];
                  return CardWidget(
                    margin: EdgeInsets.zero,
                    borderRadius: BorderRadius.circular(16),
                    backgroundColor: Colors.white,
                    elevation: 0,
                    padding: EdgeInsets.zero,
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      title: Text(
                        notification.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          notification.description,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      trailing: Text(
                        notification.timestamp,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[500],
                        ),
                      ),
                      onTap: () {
                        // Handle notification tap
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}

class NotificationItem {
  final String title;
  final String description;
  final String timestamp;

  const NotificationItem({
    required this.title,
    required this.description,
    required this.timestamp,
  });
}

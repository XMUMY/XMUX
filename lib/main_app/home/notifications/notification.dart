import 'package:flutter/material.dart' hide Notification;
import 'package:xmux/main_app/home/notifications/moodle.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: MoodleNotificationPage(),
    );
  }
}

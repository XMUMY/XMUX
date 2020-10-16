import 'package:flutter/material.dart' hide Notification;
import 'package:xmux/main_app/home/notifications/moodle.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(
                text: 'Moodle',
              )
            ],
          ),
        ),
        body: TabBarView(children: [
          MoodleNotificationPage(),
        ]),
      ),
    );
  }
}

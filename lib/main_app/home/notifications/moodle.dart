import 'dart:math';

import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:moodle/model/notification.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/lazy_loader.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/globals.dart';

class MoodleNotificationPage extends StatefulWidget {
  @override
  _MoodleNotificationPageState createState() => _MoodleNotificationPageState();
}

class _MoodleNotificationPageState extends State<MoodleNotificationPage> {
  Notification _selectedNotification;

  /// Controller for lazy loader.
  var _controller = ScrollController();

  Widget _buildNotificationList(
      BuildContext context, Notification notification, int i) {
    var languageCode = Localizations.localeOf(context).languageCode;
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          notification.subject,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Divider(height: 5, color: Colors.transparent),
        Text(
          '${DateFormat.yMMMd(languageCode).format(notification.timeCreated)} '
          '${DateFormat.Hms(languageCode).format(notification.timeCreated)}',
          style: Theme.of(context).textTheme.caption,
        ),
        Divider(),
        Text(notification.smallMessage),
      ],
    );

    Widget child;
    if (MediaQuery.of(context).size.width >= 720)
      child = FloatingCard(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        onTap: () => setState(() => _selectedNotification = notification),
        child: content,
      );
    else
      child = FloatingOpenContainer(
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        padding: const EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: content,
        openBuilder: (context, _) => _MoodleNotificationDetail(notification),
      );

    return AnimationConfiguration.staggeredList(
      position: i,
      child: SlideAnimation(
        verticalOffset: 50,
        child: FadeInAnimation(
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var list = Scrollbar(
      child: Refreshable<List<Notification>>(
        onRefresh: () async => await moodleApi.getPopupNotifications(),
        builder: (context, data) {
          return LazyLoader<List<Notification>>(
            controller: _controller,
            onLoadMore: (data) async {
              var resp =
                  await moodleApi.getPopupNotifications(offset: data.length);
              if (resp.isNotEmpty)
                data.addAll(resp);
              else
                return null;
              return true;
            },
            builder: (context, data) {
              return ListView.builder(
                controller: _controller,
                itemCount: data.length,
                itemBuilder: (context, index) =>
                    _buildNotificationList(context, data[index], index),
              );
            },
          );
        },
      ),
    );

    var width = MediaQuery.of(context).size.width;
    if (width < 720)
      return list;
    else
      // Show details in right column.
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: list,
          ),
          Expanded(
            flex: max(width ~/ 350 - 1, 1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _selectedNotification == null
                  ? Container()
                  : _MoodleNotificationDetail(
                      _selectedNotification,
                      key: ValueKey(_selectedNotification),
                      withAppBar: false,
                    ),
            ),
          ),
        ],
      );
  }
}

class _MoodleNotificationDetail extends StatelessWidget {
  final Notification notification;

  /// Whether an appbar should be added to details.
  final bool withAppBar;

  _MoodleNotificationDetail(
    this.notification, {
    Key key,
    this.withAppBar = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var doc = parse(notification.fullMessageHtml).querySelector('.content');
    doc?.querySelector('.commands')?.remove();
    doc?.querySelector('.link')?.remove();
    var content = doc?.innerHtml;

    if (content == null)
      try {
        content = notification.fullMessage.split('-' * 69)[1];
      } catch (_) {
        content = notification.fullMessage;
      }

    var detail = ListView(
      padding: MediaQuery.of(context).padding.copyWith(left: 8, right: 8),
      children: <Widget>[
        doc != null ? HtmlWidget(content) : Text(content),
      ],
    );

    if (withAppBar)
      return Scaffold(
        appBar: AppBar(
          title: Text(notification.subject),
        ),
        body: detail,
      );

    return detail;
  }
}

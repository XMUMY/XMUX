import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:html/parser.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/lazy_loading_list.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/moodle/models/notification.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Notification _selectedNotification;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Widget list = LazyLoadingList<Notification>(
      onRefresh: () async => await moodleApi.getPopupNotifications(),
      onLoadMore: (list) async =>
          await moodleApi.getPopupNotifications(offset: list.length),
      builder: (context, notification, i) {
        var content = Column(
          children: <Widget>[
            Text(
              notification.subject,
              style: Theme.of(context).textTheme.subtitle1,
            ),
            Text(
              '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(notification.timeCreated)} '
              '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(notification.timeCreated)}',
              style: Theme.of(context).textTheme.caption,
            ),
            Divider(),
            Text(notification.smallMessage),
          ],
        );

        Widget child;
        if (width > 700)
          child = FloatingCard(
            margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            padding: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            onTap: () => setState(() => _selectedNotification = notification),
            child: content,
          );
        else
          child = FloatingOpenContainer(
            margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            padding: const EdgeInsets.all(8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: content,
            openBuilder: (context, _) => NotificationDetail(notification),
          );

        return AnimationConfiguration.staggeredList(
          position: i,
          duration: const Duration(milliseconds: 250),
          child: SlideAnimation(
            verticalOffset: 50.0,
            child: FadeInAnimation(
              child: child,
            ),
          ),
        );
      },
    );

    list = Scrollbar(child: list);

    if (width < 700)
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
            flex: width > 1000 ? 3 : 2,
            child: _selectedNotification == null
                ? Container()
                : NotificationDetail(_selectedNotification, withAppBar: false),
          ),
        ],
      );
  }
}

class NotificationDetail extends StatelessWidget {
  final Notification notification;

  /// Whether an appbar should be added to details.
  final bool withAppBar;

  NotificationDetail(this.notification, {this.withAppBar = true});

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
        doc != null ? Html(data: content) : Text(content),
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

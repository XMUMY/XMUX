import 'dart:math';

import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:moodle/model/notification.dart';

import '../../component/floating_card.dart';
import '../../global.dart';
import '../../util/screen.dart';

class MoodleNotificationPage extends StatefulWidget {
  const MoodleNotificationPage({Key? key}) : super(key: key);

  @override
  _MoodleNotificationPageState createState() => _MoodleNotificationPageState();
}

class _MoodleNotificationPageState extends State<MoodleNotificationPage>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Notification>(
    firstPageKey: 0,
  );

  Notification? _selectedNotification;

  Future<void> _fetchPage(int pageKey) async {
    final resp = await moodle.getPopupNotifications(offset: pageKey);
    if (resp.isNotEmpty) {
      _pagingController.appendPage(resp, pageKey + resp.length);
    } else {
      _pagingController.appendLastPage([]);
    }
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  Widget _buildListItem(BuildContext context, Notification notification) {
    final languageCode = Localizations.localeOf(context).languageCode;
    var content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          notification.subject,
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Text(
          '${DateFormat.yMMMd(languageCode).format(notification.timeCreated)} '
          '${DateFormat.Hms(languageCode).format(notification.timeCreated)}',
          style: Theme.of(context).textTheme.caption,
        ),
        const Divider(),
        Text(notification.smallMessage),
      ],
    );

    Widget child;
    if (!(context.isBetween(Breakpoint.extraSmall) ||
        context.isBetween(Breakpoint.small1))) {
      child = FloatingCard(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: content,
        onTap: () => setState(() => _selectedNotification = notification),
      );
    } else {
      child = FloatingOpenContainer(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
        child: content,
        openBuilder: (context, _) =>
            _MoodleNotificationDetail(notification: notification),
      );
    }

    return child;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final list = PagedListView<int, Notification>(
      pagingController: _pagingController,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
      builderDelegate: PagedChildBuilderDelegate<Notification>(
        itemBuilder: (context, item, index) => _buildListItem(context, item),
      ),
    );

    if (!(context.isBetween(Breakpoint.extraSmall) ||
        context.isBetween(Breakpoint.small1))) {
      return Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: list,
          ),
          Expanded(
            flex: max(MediaQuery.of(context).size.width ~/ 400 - 1, 1),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: _selectedNotification == null
                  ? Container()
                  : _MoodleNotificationDetail(
                      key: ValueKey(_selectedNotification),
                      notification: _selectedNotification!,
                      isPage: false,
                    ),
            ),
          ),
        ],
      );
    }

    return list;
  }
}

class _MoodleNotificationDetail extends StatelessWidget {
  final Notification notification;

  /// Whether the detail is shown as an independent page.
  final bool isPage;

  const _MoodleNotificationDetail({
    Key? key,
    required this.notification,
    this.isPage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final doc = parse(notification.fullMessageHtml).querySelector('.content')
      ?..querySelector('.commands')?.remove()
      ..querySelector('.link')?.remove();
    var content = doc?.innerHtml;

    if (content == null) {
      try {
        content = notification.fullMessage.split('-' * 69)[1];
      } catch (_) {
        content = notification.fullMessage;
      }
    }

    final detail = ListView(
      padding: EdgeInsets.fromLTRB(
          isPage ? context.padBody : 0, 4, isPage ? context.padBody : 16, 4),
      children: <Widget>[
        doc != null ? HtmlWidget(content) : Text(content),
      ],
    );

    if (isPage) {
      return Scaffold(
        appBar: AppBar(
          title: Text(notification.subject),
        ),
        body: detail,
      );
    }

    return detail;
  }
}

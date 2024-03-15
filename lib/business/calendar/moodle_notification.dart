import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:moodle/moodle.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../component/catalogue_content_layout.dart';
import '../../component/floating_card.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';

class MoodleNotificationPage extends StatefulWidget {
  const MoodleNotificationPage({super.key});

  @override
  State<MoodleNotificationPage> createState() => _MoodleNotificationPageState();
}

class _MoodleNotificationPageState extends State<MoodleNotificationPage> {
  final _pagingController = PagingController<int, Notification>(
    firstPageKey: 0,
  );

  Notification? _selectedNotification;

  Future<void> _fetchPage(int pageKey) async {
    final resp = await moodle.getPopupNotifications(offset: pageKey);
    if (!mounted) return;
    if (resp.isNotEmpty) {
      _pagingController.appendPage(resp, pageKey + resp.length);
    } else {
      _pagingController.appendLastPage([]);
    }
  }

  @override
  void initState() {
    _pagingController.addPageRequestListener(_fetchPage);
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Widget _buildListItem(BuildContext context, Notification notification) {
    final languageCode = Localizations.localeOf(context).languageCode;
    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          notification.subject,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          '${DateFormat.yMMMd(languageCode).format(notification.timeCreated)} '
          '${DateFormat.Hms(languageCode).format(notification.timeCreated)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const Divider(),
        Text(notification.smallMessage),
      ],
    );

    Widget child;
    if (!Breakpoints.small.isActive(context)) {
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
    return CatalogueContentLayout(
      catalogue: PagedListView<int, Notification>(
        primary: true,
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: LegacyBreakpoint.extraSmall.margin!,
        ),
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Notification>(
          itemBuilder: (context, item, index) => _buildListItem(context, item),
        ),
      ),
      content: _selectedNotification != null
          ? _MoodleNotificationDetail(notification: _selectedNotification!)
          : null,
    );
  }
}

class _MoodleNotificationDetail extends StatelessWidget {
  final Notification notification;

  const _MoodleNotificationDetail({
    super.key,
    required this.notification,
  });

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

    final contentWidget = doc != null
        ? HtmlWidget(
            content,
            onTapUrl: (url) {
              if (url.startsWith('http://') || url.startsWith('https://')) {
                launchUrlString(url);
              }
              return true;
            },
          )
        : Linkify(
            text: content,
            onOpen: (link) {
              if (link.url.startsWith('http://') ||
                  link.url.startsWith('https://')) {
                launchUrlString(link.url);
              }
            },
          );

    final detail = ListView(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: context.padBody,
      ),
      children: [contentWidget],
    );

    if (!context.isUnderCatalogueContentLayout) {
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

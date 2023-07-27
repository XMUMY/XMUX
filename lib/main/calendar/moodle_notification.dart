import 'package:flutter/material.dart' hide Notification;
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:html/parser.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:moodle/moodle.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../component/catalogue_content_layout.dart';
import '../../component/floating_card.dart';
import '../../global.dart';
import '../../util/screen.dart';
import '../../util/tab.dart';

class MoodleNotificationPage extends StatefulWidget implements TabEntry {
  const MoodleNotificationPage({Key? key}) : super(key: key);

  @override
  String get path => 'MoodleNotification';

  @override
  String get label => LocaleKeys.Calendar_Notifications.tr();

  @override
  State<MoodleNotificationPage> createState() => _MoodleNotificationPageState();
}

class _MoodleNotificationPageState extends State<MoodleNotificationPage>
    with AutomaticKeepAliveClientMixin {
  final _pagingController = PagingController<int, Notification>(
    firstPageKey: 0,
  );

  Notification? _selectedNotification;
  bool _isNarrow = false;

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
  bool get wantKeepAlive => true;

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
    if (!_isNarrow) {
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
      primary: _isNarrow,
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: Breakpoint.extraSmall.margin!,
      ),
      pagingController: _pagingController,
      builderDelegate: PagedChildBuilderDelegate<Notification>(
        itemBuilder: (context, item, index) => _buildListItem(context, item),
      ),
    );

    return CatalogueContentLayout(
      catalogueBuilder: (context, isNarrow) {
        _isNarrow = isNarrow;
        return list;
      },
      content: _selectedNotification != null
          ? _MoodleNotificationDetail(
              key: ValueKey(_selectedNotification),
              notification: _selectedNotification!,
              isPage: false,
            )
          : null,
    );
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

    final detail = BodyPaddingBuilder(
      builder: (context, hPadding) => ListView(
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: hPadding,
        ),
        children: [contentWidget],
      ),
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

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:moodle/moodle.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../foundation/platform/breakpoint.dart';
import '../../global.dart';

class UpcomingEventPage extends StatefulWidget {
  const UpcomingEventPage({super.key});

  @override
  State<UpcomingEventPage> createState() => _UpcomingEventPageState();
}

class _UpcomingEventPageState extends State<UpcomingEventPage>
    with AutomaticKeepAliveClientMixin {
  var events = <UpcomingEvent>[];

  Future<void> _handleUpdate() async {
    events = await moodle.upcomingEvents;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _handleUpdate().then((_) => mounted ? setState(() {}) : null);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final languageCode = Localizations.localeOf(context).languageCode;

    Widget body;
    if (events.isNotEmpty) {
      body = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.padBody, vertical: 4),
        itemCount: events.length,
        itemBuilder: (context, index) {
          final event = events[index];

          return FloatingCard(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  event.name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${DateFormat.yMMMd(languageCode).format(event.timeStart)} '
                  '${DateFormat.Hms(languageCode).format(event.timeStart)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const Divider(),
                HtmlWidget(event.description),
              ],
            ),
          );
        },
      );
    } else {
      body = const EmptyErrorList();
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: body,
    );
  }
}

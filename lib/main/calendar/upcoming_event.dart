import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:intl/intl.dart';
import 'package:moodle/model/upcoming_event.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../global.dart';
import '../../util/screen.dart';

class UpcomingEventPage extends StatefulWidget {
  const UpcomingEventPage({Key? key}) : super(key: key);

  @override
  _UpcomingEventPageState createState() => _UpcomingEventPageState();
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
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  '${DateFormat.yMMMd(languageCode).format(event.timeStart)} '
                  '${DateFormat.Hms(languageCode).format(event.timeStart)}',
                  style: Theme.of(context).textTheme.caption,
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

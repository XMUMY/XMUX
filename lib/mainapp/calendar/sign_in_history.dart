import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/empty_error_page.dart';
import 'package:xmux/config.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/attendance/attendance.dart';

class AttendanceHistory extends StatefulWidget {
  final api = AttendanceApi(
    address: BackendApiConfig.attendanceAddress,
    uid: store.state.user.campusId,
  );

  @override
  _AttendanceHistoryState createState() => _AttendanceHistoryState();
}

class _AttendanceHistoryState extends State<AttendanceHistory> {
  List<AttendanceRecord> history;

  Future<Null> update() async {
    history = await widget.api.getHistory();
    if (mounted) setState(() {});
  }

  @override
  void initState() {
    update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendace'),
      ),
      body: history == null
          ? Center(child: CircularProgressIndicator())
          : history.isEmpty
              ? EmptyErrorPage()
              : RefreshIndicator(
                  onRefresh: update,
                  child: ListView.separated(
                    padding: const EdgeInsets.all(15),
                    itemCount: history.length,
                    separatorBuilder: (_, __) => Divider(),
                    itemBuilder: (_, index) =>
                        AttendanceHistoryItem(history[index]),
                  ),
                ),
    );
  }
}

class AttendanceHistoryItem extends StatelessWidget {
  final AttendanceRecord record;

  AttendanceHistoryItem(this.record);

  /// Localize message from response.
  static String parseMessage(BuildContext context, AttendanceRecord record) {
    var message = record.message;
    switch (record.status) {
      case AttendanceStatus.marked:
        message = i18n('Calendar/SignIn/Marked', context);
        break;
      case AttendanceStatus.success:
        message = i18n('Calendar/SignIn/Finished', context);
        break;
      case AttendanceStatus.failed:
        message = '${i18n('Calendar/SignIn/Failed', context)}: $message';
        break;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    var course = store.state.queryState.timetable.timetable
        .firstWhere((c) => c.cid == record.cid, orElse: () => null);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                course?.name ?? 'Unknown',
                style: Theme.of(context).textTheme.subhead,
              ),
              Text(
                '${DateFormat.yMMMd(Localizations.localeOf(context).languageCode).format(record.timestamp)} '
                '${DateFormat.Hms(Localizations.localeOf(context).languageCode).format(record.timestamp)}',
                style: Theme.of(context).textTheme.caption,
              ),
              Text(AttendanceHistoryItem.parseMessage(context, record))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(record.status == AttendanceStatus.success
              ? Icons.done
              : record.status == AttendanceStatus.failed
                  ? Icons.error_outline
                  : Icons.access_time),
        )
      ],
    );
  }
}

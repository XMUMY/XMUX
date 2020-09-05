import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:xmux/components/floating_card.dart';
import 'package:xmux/components/page_routes.dart';
import 'package:xmux/components/refreshable.dart';
import 'package:xmux/generated/l10n_keys.dart';
import 'package:xmux/globals.dart';
import 'package:xmux/modules/api/xmux_api.dart';
import 'package:xmux/modules/attendance/attendance.dart';

part 'attendance_lecturer.dart';

// ignore: non_constant_identifier_names
Widget AttendancePage() =>
    store.state.user.isStudent ? _StudentPage() : _LecturerPage();

class _StudentPage extends StatelessWidget {
  final api = AttendanceApi();

  Future<List<AttendanceRecord>> _handleUpdate() async =>
      await api.getHistory();

  @override
  Widget build(BuildContext context) {
    return Refreshable(
      onRefresh: _handleUpdate,
      builder: (context, history) => ListView.separated(
        padding: const EdgeInsets.all(15),
        itemCount: history.length,
        separatorBuilder: (_, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 250),
          child: SlideAnimation(
            verticalOffset: 50,
            child: Divider(),
          ),
        ),
        itemBuilder: (_, index) => AnimationConfiguration.staggeredList(
          position: index,
          duration: const Duration(milliseconds: 250),
          child: SlideAnimation(
            verticalOffset: 50,
            child: FadeInAnimation(
              child: AttendanceHistoryItem(history[index]),
            ),
          ),
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
        message = LocaleKeys.Calendar_AttendanceSignInMarked.tr();
        break;
      case AttendanceStatus.succeeded:
        message = LocaleKeys.Calendar_AttendanceSignInSucceeded.tr();
        break;
      case AttendanceStatus.failed:
        message =
            LocaleKeys.Calendar_AttendanceSignInFailed.tr(args: [message]);
        break;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    var course = store.state.queryState.timetable.classes
        .firstWhere((c) => c.cid == record.cid, orElse: () => null);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                course?.name ?? 'Unknown',
                style: Theme.of(context).textTheme.subtitle1,
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
          child: Icon(record.status == AttendanceStatus.succeeded
              ? Icons.done
              : record.status == AttendanceStatus.failed
                  ? Icons.error_outline
                  : Icons.access_time),
        )
      ],
    );
  }
}

import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:xmus_client/api/aaos/v4/aaos.pb.dart';

import '../../component/empty_error.dart';
import '../../component/floating_card.dart';
import '../../foundation/platform/breakpoint.dart';
import '../redux/action/action.dart';
import '../redux/state/state.dart';
import '../redux/store.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Exams>(
      distinct: true,
      converter: (s) => s.state.queries.exams,
      builder: (context, exams) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: ExamsList(exams: exams),
        );
      },
    );
  }
}

class ExamsList extends StatelessWidget {
  final List<Exams_Exam> _exams;
  final DateTime _lastUpdate;

  ExamsList({super.key, required Exams exams})
      : _exams = exams.exams,
        _lastUpdate = exams.lastUpdate.toDateTime().toLocal();

  // Handle refresh.
  Future<void> _handleUpdate() async {
    var action = UpdateExamsAction();
    store.dispatch(action);
    await action.future;
  }

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;
    var lastUpdateText = Center(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Text(
          '${DateFormat.yMMMd(languageCode).format(_lastUpdate)} '
          '${DateFormat.Hms(languageCode).format(_lastUpdate)}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );

    Widget body;
    if (_exams.isNotEmpty) {
      body = ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: context.padBody, vertical: 4),
        itemCount: _exams.length + 1,
        itemBuilder: (_, int index) => index == _exams.length
            ? lastUpdateText
            : _Card(exam: _exams[index]),
      );
    } else {
      body = const EmptyErrorList();
    }

    return RefreshIndicator(
      onRefresh: _handleUpdate,
      child: Scrollbar(child: body),
    );
  }
}

class _Card extends StatelessWidget {
  final Exams_Exam exam;

  const _Card({required this.exam});

  @override
  Widget build(BuildContext context) {
    var languageCode = Localizations.localeOf(context).languageCode;
    return FloatingCard(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            exam.courseName,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Divider(height: 8, color: Colors.transparent),
          Text(
            '${DateFormat.yMMMd(languageCode).format(exam.begin.toDateTime().toLocal())} '
            '${'Weekdays.${exam.begin.toDateTime().toLocal().weekday}'.tr()} '
            '${TimeOfDay.fromDateTime(exam.begin.toDateTime().toLocal()).format(context)} - '
            '${TimeOfDay.fromDateTime(exam.end.toDateTime().toLocal()).format(context)} ',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const Divider(height: 5, color: Colors.transparent),
          Text(exam.venue),
          Text('${exam.type}, ${exam.status}'),
        ],
      ),
    );
  }
}
